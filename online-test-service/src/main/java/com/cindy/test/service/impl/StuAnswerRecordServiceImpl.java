package com.cindy.test.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cindy.test.common.dao.QuestionDAO;
import com.cindy.test.common.dao.StuAnswerRecordDAO;
import com.cindy.test.common.dao.StudentDAO;
import com.cindy.test.common.exception.ServiceException;
import com.cindy.test.common.model.Question;
import com.cindy.test.common.model.Score;
import com.cindy.test.common.model.StuAnswerRecord;
import com.cindy.test.common.model.Student;
import com.cindy.test.common.model.dto.StuAnswerRecordDto;
import com.cindy.test.common.model.dto.StudentAnswerDto;
import com.cindy.test.common.util.BeanUtil;
import com.cindy.test.service.ScoreService;
import com.cindy.test.service.StuAnswerRecordService;
import com.google.common.collect.Lists;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 学生主观题答题记录业务实现类
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class StuAnswerRecordServiceImpl extends ServiceImpl<StuAnswerRecordDAO, StuAnswerRecord>
    implements StuAnswerRecordService {

  private final StudentDAO studentDAO;
  private final ScoreService scoreService;
  private final QuestionDAO questionDAO;
  private final StuAnswerRecordDAO stuAnswerRecordDAO;

  @Override
  public List<StuAnswerRecord> selectByPaperId(Integer paperId) {
    // 构造通过试卷 ID 查詢答题记录的条件
    LambdaQueryWrapper<StuAnswerRecord> qw = new LambdaQueryWrapper<>();
    qw.eq(StuAnswerRecord::getPaperId, paperId);
    List<StuAnswerRecord> result = this.stuAnswerRecordDAO.selectList(qw);
    // 检查集合对象的情况
    if (CollUtil.isEmpty(result)) {
      throw new ServiceException("这场试卷不存待复查的主观题");
    } else {
      return result;
    }
  }

  @Override
  @Transactional(rollbackFor = Exception.class)
  public void deleteByStuId(Integer stuId) {
    LambdaQueryWrapper<StuAnswerRecord> qw = new LambdaQueryWrapper<>();
    qw.eq(StuAnswerRecord::getStuId, stuId);
    this.stuAnswerRecordDAO.delete(qw);
  }

  @Override
  public List<StuAnswerRecordDto> listStuAnswerRecordDto(Integer paperId) {
    // 学生答题记录数据传输集合
    List<StuAnswerRecordDto> stuAnswerRecordDtoList = Lists.newArrayList();
    List<StuAnswerRecord> stuAnswerRecords = this.selectByPaperId(paperId);

    // 存在主观题，进行排序和过滤
    Collection<List<StuAnswerRecord>> values =
        stuAnswerRecords.stream()
            // 根据问题的 ID 排序
            .sorted(Comparator.comparingInt(StuAnswerRecord::getQuestionId))
            // 根据学生 ID 分组
            .collect(Collectors.groupingBy(StuAnswerRecord::getStuId))
            // 取出集合
            .values();

    // 循环设置参数
    for (List<StuAnswerRecord> record : values) {
      // 取出索引位置 0 的学生 ID
      int stuId = record.get(0).getStuId();
      // 查询到该学生学生信息
      Student student = this.studentDAO.selectById(stuId);
      // 查询该考生该本考试的成绩信息
      Score score = this.scoreService.selectByStuIdAndPaperId(stuId, paperId);

      // 拷贝对象信息
      List<StudentAnswerDto> rec = BeanUtil.copyList(record, StudentAnswerDto.class);
      // 遍历查询并封装题目名称
      for (StudentAnswerDto studentAnswerDto : rec) {
        Question qs = this.questionDAO.selectById(studentAnswerDto.getQuestionId());
        studentAnswerDto.setQuestionName(qs.getQuestionName());
      }

      // 封装学生答题记录数据传输对象信息
      StuAnswerRecordDto dto = new StuAnswerRecordDto();
      // 封装传输对象参数
      dto.setStudent(student).setScore(score).setRecords(rec);
      // 加入学生答题记录数据传输集合中
      stuAnswerRecordDtoList.add(dto);
    }

    return stuAnswerRecordDtoList;
  }
}
