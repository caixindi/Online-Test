package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 教师查询bean
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class QueryTeacherDto extends BaseEntity {

  private String key;

  private Integer academyId;

}
