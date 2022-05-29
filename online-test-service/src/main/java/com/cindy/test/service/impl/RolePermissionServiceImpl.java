package com.cindy.test.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cindy.test.common.dao.RolePermissionDAO;
import com.cindy.test.common.model.RolePermission;
import com.cindy.test.service.RolePermissionService;
import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * (RolePermission)表服务实现类
 */
@Service
@RequiredArgsConstructor
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionDAO, RolePermission>
    implements RolePermissionService {

  private final RolePermissionDAO rolePermissionDAO;

  @Override
  public List<RolePermission> selectByRoleId(Integer roleId) {
    LambdaQueryWrapper<RolePermission> rpQw = new LambdaQueryWrapper<>();
    rpQw.eq(RolePermission::getRoleId, roleId);
    return this.rolePermissionDAO.selectList(rpQw);
  }
}
