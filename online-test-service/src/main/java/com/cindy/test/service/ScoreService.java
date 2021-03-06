package com.cindy.test.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cindy.test.common.model.Score;
import com.cindy.test.common.model.dto.AnswerEditDto;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

/**
 * 分数业务接口
 */
public interface ScoreService extends IService<Score> {

  /**
   * 通过学生 ID 查询分数 List 集合
   *
   * @param id 学生 ID
   * @return 分数 List 集合
   */
  List<Score> selectByStuId(Integer id);

  /**
   * 通过学号查询分数分页集合
   *
   * @param page  分页信息
   * @param stuId 学生id
   * @return 分页信息
   */
  Map<String, Object> pageByStuId(Page<Score> page, Integer stuId);

  /**
   * 统计该学生本学期所有课程的平均成绩
   *
   * @param id 学生ID
   * @return 本学期所有课程的平均成绩 List 集合
   */
  List<Map<String, Object>> averageScore(Integer id);

  /**
   * 根据分数段统计该学生的课程门数和具体课程
   *
   * @param studentId 学生ID
   * @return 课程门数和具体课程 List 集合
   */
  List<Map<String, Object>> countByLevel(Integer studentId);

  /**
   * 根据学生ID和试卷ID修改成绩
   *
   * @param entity 修改的信息
   */
  void updateScoreByStuIdAndPaperId(AnswerEditDto entity);

  /**
   * 通过学生ID和试卷ID查询成绩详情
   *
   * @param stuId   学生ID
   * @param paperId 试卷ID
   * @return Score：成绩详情
   */
  Score selectByStuIdAndPaperId(Integer stuId, Integer paperId);

  /**
   * 通过学生 ID 删除分数
   *
   * @param stuId 学生ID
   */
  void deleteByStuId(Integer stuId);

  /**
   * 通过试卷id 查询成绩集合
   *
   * @param paperId 试卷id
   * @return 成绩集合
   */
  List<Score> selectByPaperId(Integer paperId);

  /**
   * 统计该班级某门考试的平均分
   *
   * @param gradeId 班级ID
   * @param paperId 试卷ID
   * @return Map<String, Object>
   */
  Map<String, Object> averageGradeScore(Integer paperId, Integer gradeId);

  /**
   * 导出试卷分析表
   *
   * @param gradeId  班级ID
   * @param paperId  试卷ID
   * @param response 响应对象
   */
  void outputPaperChartExcel(Integer paperId, Integer gradeId, HttpServletResponse response);

  /**
   * 导出学生成绩分析表
   *
   * @param studentId 学生ID
   */
  void outputScoreChartExcel(Integer studentId, HttpServletResponse response);


  /**
   * 获取某场考试的的某个班级的分数信息
   *
   * @param paperId 试卷id
   * @param gradeId 班级id
   * @return 分数集合
   */
  List<Score> selectByPaperIdAndGradeId(Integer paperId, Integer gradeId);
}
