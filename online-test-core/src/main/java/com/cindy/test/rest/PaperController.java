package com.cindy.test.rest;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cindy.test.common.base.R;
import com.cindy.test.common.constant.SysConsts.Session;
import com.cindy.test.common.model.Paper;
import com.cindy.test.common.model.StuAnswerRecord;
import com.cindy.test.common.model.Teacher;
import com.cindy.test.common.model.dto.AnswerEditDto;
import com.cindy.test.common.model.dto.ImportPaperDto;
import com.cindy.test.common.model.dto.ImportPaperRandomQuestionDto;
import com.cindy.test.common.model.dto.PaperQuestionUpdateDto;
import com.cindy.test.common.model.dto.QueryPaperDto;
import com.cindy.test.common.util.HttpUtil;
import com.cindy.test.core.annotation.Limit;
import com.cindy.test.core.annotation.Permissions;
import com.cindy.test.service.PaperService;
import com.cindy.test.service.QuestionService;
import com.cindy.test.service.ScoreService;
import com.cindy.test.service.StuAnswerRecordService;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/paper")
public class PaperController {

  private final ScoreService scoreService;
  private final StuAnswerRecordService stuAnswerRecordService;
  private final QuestionService questionService;
  private final PaperService paperService;

  @PostMapping("/update")
  @Permissions("paper:update")
  public R updateTime(Paper paper) {
    this.paperService.updateById(paper);
    return R.success();
  }

  @PostMapping("/update/gradeIds")
  public R updateGradeIds(Paper paper) {
    this.paperService.updateGradeIds(paper);
    return R.success();
  }

  @GetMapping("/{id}")
  @Permissions("paper:list")
  public Paper getOne(@PathVariable Integer id) {
    return this.paperService.getById(id);
  }

  @GetMapping("/list")
  @Permissions("paper:list")
  @Limit(key = "paperList", period = 5, count = 15, name = "??????????????????", prefix = "limit")
  public Map<String, Object> pagePaper(Page<Paper> page, QueryPaperDto entity) {
    return this.paperService.pagePaper(page, entity);
  }

  @PostMapping("/import/excel")
  @Permissions("paper:import")
  public R excel(@RequestParam("file") MultipartFile multipartFile) {
    // ????????????
    ImportPaperDto dto = this.questionService.importPaper(multipartFile);
    return R.successWithData(dto);
  }

  @PostMapping("/save/import")
  @Permissions("paper:save")
  public R newPaperByExcel(Paper paper, ImportPaperRandomQuestionDto entity) {
    // ???????????? ID
    Teacher teacher = (Teacher) HttpUtil.getAttribute(Session.TEACHER);
    // ??????????????????
    paper.setTeacherId(teacher.getId());
    // ??????????????????
    paper.setAcademyId(teacher.getAcademyId());
    // ?????????????????????????????????????????????????????????????????????????????????
    boolean[] res = {entity.getA() == 0, entity.getB() == 0, entity.getC() == 0, entity.getD() == 0,
        entity.getE() == 0, entity.getF() == 0};
    for (boolean e : res) {
      if (!e) {
        this.paperService.saveWithImportPaper(paper, entity);
      }
    }
    this.paperService.save(paper);
    return R.successWithData(paper.getId());
  }

  /**
   * ??????????????????
   *
   * @param paper       ????????????
   * @param paperFormId ????????????ID
   * @return ????????????
   */
  @PostMapping("/save/random")
  @Permissions("paper:save")
  public R add(@Valid Paper paper, Integer paperFormId, String difficulty) {
    // ?????????????????? ID
    paper.setPaperFormId(paperFormId);
    // ???????????? ID
    Teacher teacher = (Teacher) HttpUtil.getAttribute(Session.TEACHER);
    // ??????????????????
    paper.setTeacherId(teacher.getId());
    // ??????????????????
    paper.setAcademyId(teacher.getAcademyId());
    // ????????????????????????
    paperService.randomNewPaper(paper, difficulty);
    return R.successWithData(paper.getId());
  }

  /**
   * ?????????????????????
   *
   * @param dto ??????
   */
  @PostMapping("/update/score")
  @Permissions("paper:update")
  public R editScore(@Valid AnswerEditDto dto) {
    // ??????????????????
    StuAnswerRecord record = new StuAnswerRecord();
    record.setId(dto.getId()).setScore(dto.getNewScore());
    this.stuAnswerRecordService.updateById(record);
    // ????????????
    StuAnswerRecord stuRec = this.stuAnswerRecordService.getById(dto.getId());
    // ????????????
    dto.setStuId(stuRec.getStuId());
    dto.setPaperId(stuRec.getPaperId());
    this.scoreService.updateScoreByStuIdAndPaperId(dto);
    return R.success();
  }

  /**
   * ??????????????????????????????????????????
   *
   * @param id ??????ID
   * @return ????????????
   */
  @PostMapping("/delete/{id}")
  @Permissions("paper:delete")
  public R delPaper(@PathVariable Integer id) {
    // ?????????????????????????????????????????????
    paperService.deletePaperById(id);
    return R.success();
  }

  /**
   * ??????????????????
   *
   * @param dto ???????????????
   * @return ????????????
   */
  @PostMapping("/update/question")
  @Permissions("paper:update")
  public R updateQuestionId(PaperQuestionUpdateDto dto) {
    this.paperService.updateQuestionId(dto);
    return R.success();
  }

  @GetMapping("/chart/analysis")
  public void outputAnalysis(Integer paperId, Integer gradeId, HttpServletResponse response) {
    this.scoreService.outputPaperChartExcel(paperId, gradeId, response);
  }

  @GetMapping("/export/{paperId}")
  public void outputPaper(@PathVariable Integer paperId, HttpServletResponse response) {
    this.paperService.outputPaperExcel(paperId, response);
  }
}
