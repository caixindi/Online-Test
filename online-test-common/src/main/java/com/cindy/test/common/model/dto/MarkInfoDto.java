package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import com.cindy.test.common.model.StuAnswerRecord;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 评分信息实体类
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class MarkInfoDto extends BaseEntity {

  private Integer score;

  private List<String> wrongIds;

  private List<StuAnswerRecord> stuAnswerRecord;
}
