package com.cindy.test.common.model;

import com.baomidou.mybatisplus.annotation.TableId;
import com.cindy.test.common.base.BaseEntity;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 学院表实体类
 */
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Data
public class Academy extends BaseEntity {

  /**
   * 学院id
   */
  @TableId
  private Integer id;

  /**
   * 学院名称
   */
  @NotBlank(message = "学院名称{required}")
  @Size(min = 2, max = 30, message = "学院名称{range}")
  private String name;

}
