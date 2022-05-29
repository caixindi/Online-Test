package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
@Data
public class QueryQuestionDto extends BaseEntity {

  private Integer courseId;

  private Integer typeId;

  private String questionName;
}
