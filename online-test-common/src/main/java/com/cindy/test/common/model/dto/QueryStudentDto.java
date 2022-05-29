package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 学生查询 bean
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class QueryStudentDto extends BaseEntity {

  // 查询关键词
  private String key;

  private Integer academyId;
}
