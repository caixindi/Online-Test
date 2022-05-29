package com.cindy.test.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cindy.test.common.model.RolePermission;
import java.util.List;

/**
 * (RolePermission)表服务接口
 */
public interface RolePermissionService extends IService<RolePermission> {

  /**
   * 通过角色 ID 获取权限 ID
   *
   * @param roleId 角色 ID
   * @return 权限集合
   */
  List<RolePermission> selectByRoleId(Integer roleId);
}
