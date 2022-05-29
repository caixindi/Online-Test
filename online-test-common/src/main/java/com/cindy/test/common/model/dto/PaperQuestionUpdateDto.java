package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
@Data
public class PaperQuestionUpdateDto extends BaseEntity {

  private Integer paperId;

  private Integer oldId;

  private Integer newId;
}
