package com.cindy.test.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cindy.test.common.constant.SysConsts.Role;
import com.cindy.test.common.dao.PermissionDAO;
import com.cindy.test.common.model.Permission;
import com.cindy.test.common.model.RolePermission;
import com.cindy.test.service.PermissionService;
import com.cindy.test.service.RolePermissionService;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * (Permission)表服务实现类
 */
@Service
@RequiredArgsConstructor
public class PermissionServiceImpl extends ServiceImpl<PermissionDAO, Permission>
    implements PermissionService {

  @Value("${otp.cache.permission_prefix}")
  private String prefix;

  private final PermissionDAO permissionDAO;
  private final RedisTemplate<String, Object> redisService;
  private final RolePermissionService rolePermissionService;

  @Override
  public Set<String> selectExpressionByRoleId(Integer roleId) {
    return permissionManager(roleId);
  }

  /**
   * 权限缓存管理器
   *
   * @param roleId 角色 ID
   */
  @SuppressWarnings("unchecked")
  private Set<String> permissionManager(Integer roleId) {
    // 缓存键
    final String key = prefix + roleId;
    // 从缓存中获取权限信息
    Object obj = redisService.opsForValue().get(key);
    if (ObjectUtil.isNotEmpty(obj)) {
      return (Set<String>) obj;
    }

    // 组装权限信息
    Set<String> result = Sets.newHashSet();
    // 判断角色等级
    if (roleId.equals(Role.ADMIN)) {
      // 管理员直接拥有所有权限表达式
      List<Permission> permissions = this.permissionDAO.selectList(null);
      permissions.forEach(pm -> result.add(pm.getExpression()));
    } else {
      List<RolePermission> rolePermissions = this.rolePermissionService.selectByRoleId(roleId);
      // 取出权限信息
      List<Integer> permissionIds = Lists.newArrayList();
      rolePermissions.forEach(rp -> permissionIds.add(rp.getPermissionId()));
      // 查询权限表达式
      if (CollUtil.isNotEmpty(permissionIds)) {
        List<Permission> permissions = this.permissionDAO.selectBatchIds(permissionIds);
        permissions.forEach(pm -> result.add(pm.getExpression()));
      }
    }

    // 缓存到 redis 中
    this.redisService.opsForValue().set(key, result, 3, TimeUnit.HOURS);
    return result;
  }
}
