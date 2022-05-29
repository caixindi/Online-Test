package com.cindy.test.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cindy.test.common.model.StuAnswerRecord;
import com.cindy.test.common.model.dto.StuAnswerRecordDto;
import java.util.List;

/**
 * 学生主观题答题记录表服务接口
 */
public interface StuAnswerRecordService extends IService<StuAnswerRecord> {

  /**
   * 根据试卷ID查找复查试题记录
   *
   * @param paperId 试卷ID
   * @return 答题信息
   */
  List<StuAnswerRecord> selectByPaperId(Integer paperId);

  /**
   * 通过学生 ID 删除答题记录
   *
   * @param stuId 学生ID
   */
  void deleteByStuId(Integer stuId);

  /**
   * 通过试卷ID查询学生答题记录集合传输对象
   *
   * @param paperId 试卷ID
   * @return 集合对象
   */
  List<StuAnswerRecordDto> listStuAnswerRecordDto(Integer paperId);
}
