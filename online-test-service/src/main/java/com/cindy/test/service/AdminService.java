package com.cindy.test.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cindy.test.common.model.Admin;
import com.cindy.test.common.model.dto.ChangePassDto;

import com.cindy.test.common.model.dto.QueryAdminDto;
import java.util.Map;

/**
 * 管理员业务接口
 */
public interface AdminService extends IService<Admin> {

  /**
   * 管理员登录
   *
   * @param number   管理员账号
   * @param password 管理员密码
   * @return 管理员信息
   */
  Admin login(String number, String password);

  /**
   * 通过管理员账号查询管理员信息
   *
   * @param number 管理员账号
   * @return 管理员信息
   */
  Admin selectByNumber(String number);

  /**
   * 修改管理员密码
   *
   * @param dto 密码信息
   */
  void updatePassword(ChangePassDto dto);

  /**
   * 分頁獲取管理员信息
   *
   * @param page   分页信息
   * @param entity 模糊条件
   * @return 分页结果集
   */
  Map<String, Object> listPage(Page<Admin> page, QueryAdminDto entity);
}
