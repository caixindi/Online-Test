package com.cindy.test.common.model.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
@Data
public class QueryGradeDto {

  private Integer level;

  private String key;

  private Integer academyId;

  private Integer majorId;
}
