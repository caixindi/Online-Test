package com.cindy.test.common.model;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * (Permission)表实体类
 */
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Permission {

  // 权限 ID
  @TableId
  private Integer id;
  // 权限名称
  private String name;
  // 权限表达式
  private String expression;
}
