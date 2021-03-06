package com.cindy.test.rest;

import com.cindy.test.common.base.R;
import com.cindy.test.common.constant.SysConsts;
import com.cindy.test.common.model.PaperForm;
import com.cindy.test.core.annotation.Permissions;
import com.cindy.test.service.PaperFormService;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/paperForm")
public class PaperFormController {

  @Resource
  private PaperFormService paperFormService;

  /**
   * 删除模版不跳转页面
   *
   * @param id 试卷模板ID
   * @return 当前试卷模板页面
   */
  @GetMapping("/delete/{id}")
  @Permissions("paperForm:delete")
  public R delPaperForm(@PathVariable Integer id) {
    // 调用试卷模板已出接口（通过ID删除）
    this.paperFormService.removeById(id);
    return R.success();
  }

  /**
   * 试卷题型模版
   *
   * @param paperForm 试卷题型
   * @return 试卷题型页面
   */
  @PostMapping("/save")
  @Permissions("paperForm:save")
  public R addPaperForm(PaperForm paperForm) {
    // 设置模板类型
    paperForm.setType(SysConsts.PaperForm.INSERT);
    // 调用试卷模板新增接口
    this.paperFormService.save(paperForm);
    return R.successWithData(paperForm.getId());
  }
}
