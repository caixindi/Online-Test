package com.cindy.test.common.model.vo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.cindy.test.common.base.BaseEntity;
import com.cindy.test.common.model.Academy;
import com.cindy.test.common.model.Major;
import com.cindy.test.common.model.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 学生详细信息实体
 */
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Data
public class StudentVo extends BaseEntity {

  @TableId
  private Integer id;

  /**
   * 学生姓名
   */
  private String name;

  /**
   * 学号
   */
  private String stuNumber;

  /**
   * 角色id
   */
  private Integer roleId;

  /**
   * 性别
   */
  private String sex;

  /**
   * 专业id
   */
  private Integer majorId;

  /**
   * 专业信息
   */
  private Major major;

  /**
   * 年级
   */
  private Integer level;

  /**
   * 角色信息
   */
  private Role role;

  /**
   * 学院信息
   */
  private Academy academy;

  /**
   * 班级编号
   */
  private Integer gradeId;
}
