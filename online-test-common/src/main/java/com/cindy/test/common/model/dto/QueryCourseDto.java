package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
@Data
public class QueryCourseDto extends BaseEntity {

  private Integer teacherId;

  private Integer academyId;

  private String key;

}
