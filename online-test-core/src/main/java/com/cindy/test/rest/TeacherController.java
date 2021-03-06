package com.cindy.test.rest;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cindy.test.common.base.R;
import com.cindy.test.common.constant.SysConsts;
import com.cindy.test.common.model.Teacher;
import com.cindy.test.common.model.dto.ChangePassDto;
import com.cindy.test.common.model.dto.LoginDto;
import com.cindy.test.common.model.dto.QueryTeacherDto;
import com.cindy.test.common.util.HttpUtil;
import com.cindy.test.common.util.RsaCipherUtil;
import com.cindy.test.core.annotation.Limit;
import com.cindy.test.core.annotation.Permissions;
import com.cindy.test.service.TeacherService;
import com.cindy.test.util.model.Captcha;
import com.cindy.test.util.service.CaptchaService;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/teacher")
public class TeacherController {

  @Resource
  private TeacherService teacherService;
  @Resource
  private CaptchaService captchaService;

  /**
   * 教师登录
   *
   * @param entity 账号密码
   * @return 教师主页
   */
  @PostMapping("/login")
  @Limit(key = "teacherLogin", period = 60, count = 8, name = "教师登录接口", prefix = "limit")
  public R login(@Valid LoginDto entity, @Valid Captcha captcha) {
    // 验证码验证
    this.captchaService.validate(captcha);
    // 执行登录
    Teacher teacher = teacherService.login(entity.getUsername(), entity.getPassword());
    // 设置 session 信息
    HttpSession session = HttpUtil.getSession();
    session.setAttribute(SysConsts.Session.ROLE_ID, teacher.getRoleId());
    session.setAttribute(SysConsts.Session.TEACHER_ID, teacher.getId());
    session.setAttribute(SysConsts.Session.TEACHER, teacher);
    // 重定向到教师主页
    return R.successWithData(teacher.getId());
  }

  /**
   * 修改密码
   *
   * @param dto 密码信息
   * @return 重定向登录页面
   */
  @PostMapping("/update/pass")
  @Permissions("teacher:update:password")
  public R updatePassword(ChangePassDto dto) {
    // 获取 session 对象
    HttpSession session = HttpUtil.getSession();
    // 调用密码修改接口
    teacherService.updatePassword(dto);
    // 移除 session 信息
    session.removeAttribute(SysConsts.Session.ROLE_ID);
    session.removeAttribute(SysConsts.Session.TEACHER_ID);
    session.removeAttribute(SysConsts.Session.TEACHER);
    return R.success();
  }

  @GetMapping("/{id}")
  @Permissions("teacher:list")
  public Teacher getOne(@PathVariable Integer id) {
    return this.teacherService.getById(id);
  }

  /**
   * 更新教师信息
   *
   * @param teacher 教师信息
   * @return 成功信息
   */
  @PostMapping("/update")
  @Permissions("teacher:update")
  public R updateTeacher(Teacher teacher) {
    // 通过ID关系教师信息
    this.teacherService.updateById(teacher);
    return R.success();
  }

  /**
   * 增加教师
   *
   * @param teacher 教师信息
   * @return 成功信息
   */
  @PostMapping("/save")
  @Permissions("teacher:save")
  public R saveTeacher(@Valid Teacher teacher) {
    // 调用教师信息新增接口
    this.teacherService.save(teacher);
    return R.success();
  }

  /**
   * 删除教师
   *
   * @param id 教师ID
   * @return 回调信息
   */
  @PostMapping("/delete/{id}")
  @Permissions("teacher:delete")
  public R deleteTeacher(@PathVariable Integer id) {
    this.teacherService.removeById(id);
    return R.success();
  }

  /**
   * 重置密码
   *
   * @return 分页结果集
   */
  @PostMapping("/restPassword/{id}")
  public R restPassword(@PathVariable Integer id) {
    String hash = RsaCipherUtil.hash(SysConsts.DEFAULT_PASSWORD);
    Teacher build = Teacher.builder().id(id).password(hash).build();
    this.teacherService.updateById(build);
    return R.success();
  }

  /**
   * 分页获取教师信息
   *
   * @param page 分页结果集
   * @return 分页信息结果集
   */
  @GetMapping("/list")
  @Permissions("teacher:list")
  @Limit(key = "teacherList", period = 5, count = 15, name = "教师查询接口", prefix = "limit")
  public Map<String, Object> page(Page<Teacher> page, QueryTeacherDto entity) {
    return this.teacherService.listPage(page, entity);
  }
}
