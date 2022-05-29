package com.cindy.test.common.model;

import com.baomidou.mybatisplus.annotation.TableId;
import com.cindy.test.common.base.BaseEntity;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 专业信息实体
 */
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Major extends BaseEntity {

  @TableId
  private Integer id;

  /**
   * 专业班级
   */
  @NotBlank(message = "专业名称{required}")
  @Size(max = 20, message = "专业名称{noMoreThan}")
  private String major;

  /**
   * 学院
   */
  @NotNull(message = "归属学院{required}")
  private Integer academyId;
}
