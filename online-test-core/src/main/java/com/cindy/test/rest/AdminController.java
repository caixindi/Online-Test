package com.cindy.test.rest;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cindy.test.common.base.R;
import com.cindy.test.common.constant.SysConsts;
import com.cindy.test.common.model.Admin;
import com.cindy.test.common.model.dto.ChangePassDto;
import com.cindy.test.common.model.dto.LoginDto;
import com.cindy.test.common.model.dto.QueryAdminDto;
import com.cindy.test.common.util.HttpUtil;
import com.cindy.test.common.util.RsaCipherUtil;
import com.cindy.test.core.annotation.Limit;
import com.cindy.test.core.annotation.Permissions;
import com.cindy.test.service.AdminService;
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
@RequestMapping("/api/admin")
public class AdminController {

  @Resource
  private AdminService adminService;
  @Resource
  private CaptchaService captchaService;

  /**
   * 管理员登录<a href="http://localhost:8080/login>管理员登录接口</a>
   *
   * @param entity 账号密码
   * @return 管理员信息
   */
  @PostMapping("/login")
  @Limit(key = "adminLogin", period = 60, count = 8, name = "管理员登录接口", prefix = "limit")
  public R login(@Valid LoginDto entity, @Valid Captcha captcha) {
    // 验证码验证
    this.captchaService.validate(captcha);
    // 登陆操作
    Admin admin = this.adminService.login(entity.getUsername(), entity.getPassword());
    // 设置session
    HttpSession session = HttpUtil.getSession();
    session.setAttribute(SysConsts.Session.ADMIN, admin);
    session.setAttribute(SysConsts.Session.ROLE_ID, admin.getRoleId());
    // 重定向到管理员主页
    return R.successWithData(admin.getId());
  }

  /**
   * 删除管理员
   *
   * @param id 管理员id
   * @return 删除回调信息
   */
  @PostMapping("/delete/{id}")
  @Permissions("admin:delete")
  public R deleteAdmin(@PathVariable Integer id) {
    // 执行删除
    this.adminService.removeById(id);
    return R.success();
  }

  /**
   * 新增管理员
   *
   * @param admin 管理员信息
   * @return 回调信息
   */
  @PostMapping("/save")
  @Permissions("admin:save")
  public R saveAdmin(@Valid Admin admin) {
    // 对于管理员增加接口
    this.adminService.save(admin);
    return R.success();
  }

  /**
   * 提交修改密码信息
   *
   * @param dto 新旧密码信息
   * @return 回调信息
   */
  @PostMapping("/update/pass")
  @Permissions("admin:update:password")
  public R updatePass(@Valid ChangePassDto dto) {
    // 调用密码修改接口
    this.adminService.updatePassword(dto);
    // 获取 session 对象后，移除 session 信息
    HttpSession session = HttpUtil.getSession();
    session.removeAttribute(SysConsts.Session.TEACHER_ID);
    session.removeAttribute(SysConsts.Session.ROLE_ID);
    session.removeAttribute(SysConsts.Session.TEACHER);
    // 重定向登录页面
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
    Admin build = Admin.builder().id(id).password(hash).build();
    this.adminService.updateById(build);
    return R.success();
  }

  /**
   * 分页获取管理员信息
   *
   * @param page 分页信息
   * @return 分页结果集
   */
  @GetMapping("/list")
  @Permissions("admin:list")
  public Map<String, Object> page(Page<Admin> page, QueryAdminDto entity) {
    return this.adminService.listPage(page, entity);
  }
}
