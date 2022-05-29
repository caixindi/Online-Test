package com.cindy.test.rest;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cindy.test.common.base.R;
import com.cindy.test.common.constant.SysConsts;
import com.cindy.test.common.model.Score;
import com.cindy.test.common.model.vo.StudentVo;
import com.cindy.test.common.util.HttpUtil;
import com.cindy.test.core.annotation.Permissions;
import com.cindy.test.service.ScoreService;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/score")
public class ScoreController {

  @Resource
  private ScoreService scoreService;

  /**
   * 雷达图 成绩与平均成绩比较
   *
   * @return 成绩与平均成绩比较页面
   */
  @PostMapping("/student/chart/{id}")
  @Permissions("score:chart")
  public R stuChart(@PathVariable Integer id) {
    return R.successWithData(scoreService.averageScore(id));
  }

  /**
   * 雷达图 成绩与平均成绩比较
   *
   * @return 成绩与平均成绩比较页面
   */
  @PostMapping("/grade/chart/{paperId}/{gradeId}")
  public R gradeChart(@PathVariable Integer paperId, @PathVariable Integer gradeId) {
    return R.successWithData(scoreService.averageGradeScore(paperId, gradeId));
  }

  /**
   * 统计该学生成绩分布
   *
   * @return 统计该学生成绩分布页面
   */
  @GetMapping("/student/chart2")
  @Permissions("score:chart")
  public R stuSelfChart() {
    // 获取学生的 ID
    StudentVo student = (StudentVo) HttpUtil.getAttribute(SysConsts.Session.STUDENT);
    // 设置成绩分布集合的 model 对象信息
    return R.successWithData(scoreService.countByLevel(student.getId()));
  }

  /**
   * 获取学生乘机分业数据
   *
   * @return 获取学生乘机分业数据
   */
  @GetMapping("/list")
  @Permissions("score:list")
  public Map<String, Object> pageScore(Page<Score> page) {
    // 获取学生的 ID
    StudentVo student = (StudentVo) HttpUtil.getAttribute(SysConsts.Session.STUDENT);
    return this.scoreService.pageByStuId(page, student.getId());
  }

  /**
   * 成绩分析
   *
   * @param studentId 学生id
   */
  @GetMapping("/chart/analysis")
  public void outputAnalysis(Integer studentId, HttpServletResponse response) {
    this.scoreService.outputScoreChartExcel(studentId, response);
  }
}
