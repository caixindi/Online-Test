package com.cindy.test.common.model.vo;

import com.cindy.test.common.base.BaseEntity;
import com.cindy.test.common.model.Academy;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 专业 vo 对象
 */
@EqualsAndHashCode(callSuper = false)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MajorVo extends BaseEntity {

  private Integer id;

  /** 专业班级 */
  private String major;

  /** 学院 */
  private Integer academyId;

  private Academy academy;
}
