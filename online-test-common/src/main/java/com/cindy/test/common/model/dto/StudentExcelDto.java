package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
@Data
public class StudentExcelDto extends BaseEntity {

  /**
   * 学号
   */
  private String stuNumber;

  /**
   * 专业统一代码
   */
  private Integer majorId;

  /**
   * 性别
   */
  private Integer sex;

  /**
   * 姓名
   */
  private String name;

  /**
   * 学生年级
   */
  private Integer level;

  /**
   * 班级id
   */
  private Integer gradeId;
}
