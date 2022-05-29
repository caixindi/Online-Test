package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 导入试卷bean
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImportPaperDto extends BaseEntity {

  private Integer paperFormId;

  private Integer score;

  private String paperName;

  private String questionIdList;
}
