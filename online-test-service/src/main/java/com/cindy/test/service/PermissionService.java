package com.cindy.test.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cindy.test.common.model.Permission;
import java.util.Set;

/**
 * (Permission)表服务接口
 */
public interface PermissionService extends IService<Permission> {

  /**
   * 获取用户权限表达式
   *
   * @param roleId 角色id
   * @return 权限表达式集合：Set
   */
  Set<String> selectExpressionByRoleId(Integer roleId);
}
