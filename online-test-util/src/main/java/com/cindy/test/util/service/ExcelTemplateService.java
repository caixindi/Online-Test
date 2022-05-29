package com.cindy.test.util.service;

import com.cindy.test.common.model.Paper;
import com.cindy.test.common.model.Question;
import com.cindy.test.common.model.Score;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

public interface ExcelTemplateService {

  /**
   * 填充班级考情分析表 Excel 导出接口
   *
   * @param sheetMap 表数据
   * @param response 响应对象
   */
  void packingPaperAnalysis(Map<String, Object> sheetMap, HttpServletResponse response);

  /**
   * 填充试卷
   *
   * @param questionList 问题集合
   * @param response     响应对象
   */
  void packingPaper(Paper paper, List<Question> questionList, HttpServletResponse response);

  /**
   * 填充试卷
   *
   * @param questionList 问题集合
   * @param response     响应对象
   */
  void packingStudentScoreAnalysis(List<Score> questionList, HttpServletResponse response);
}
