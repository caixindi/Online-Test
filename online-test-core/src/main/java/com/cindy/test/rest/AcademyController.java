package com.cindy.test.rest;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cindy.test.common.base.R;
import com.cindy.test.common.model.Academy;
import com.cindy.test.core.annotation.Permissions;
import com.cindy.test.service.AcademyService;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 学院控制层
 */
@RestController
@RequestMapping("/api/academy")
public class AcademyController {

  @Resource
  private AcademyService academyService;

  /**
   * Rest 获取学院集合
   *
   * @return 学院集合
   */
  @GetMapping
  @Permissions("academy:list")
  public List<Academy> list() {
    return this.academyService.list();
  }

  /**
   * Rest 获取学院集合
   *
   * @return 学院集合
   */
  @GetMapping("/list")
  @Permissions("academy:list")
  public Map<String, Object> page(Page<Academy> page) {
    return this.academyService.listPage(page);
  }

  /**
   * Rest 获取单个学员
   *
   * @param id 学院 ID
   * @return 学院信息
   */
  @GetMapping("/{id}")
  @Permissions("academy:list")
  public Academy getOne(@PathVariable Integer id) {
    return this.academyService.getById(id);
  }

  /**
   * 更新学院信息
   *
   * @param academy 教师信息
   * @return 成功信息
   */
  @ResponseBody
  @PostMapping("/update")
  @Permissions("academy:update")
  public R updateAcademy(@Valid Academy academy) {
    // 调用学院更新接口
    this.academyService.updateById(academy);
    return R.success();
  }

  /**
   * 增加学院
   *
   * @param academy 教师信息
   * @return 成功信息
   */
  @PostMapping("/save")
  @Permissions("academy:save")
  public R saveAcademy(@Valid Academy academy) {
    // 调用学院新增接口
    this.academyService.save(academy);
    return R.success();
  }

  /**
   * 删除学院
   *
   * @param id 学院ID
   * @return 响应信息
   */
  @PostMapping("/delete/{id}")
  @Permissions("academy:delete")
  public R delete(@PathVariable Integer id) {
    // 调用删除接口
    this.academyService.removeById(id);
    return R.success();
  }
}
