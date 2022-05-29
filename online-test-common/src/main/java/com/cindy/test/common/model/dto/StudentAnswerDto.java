package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 学生答题记录bean
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class StudentAnswerDto extends BaseEntity {

  /** 题目ID */
  private Integer id;

  /** 题目内容 */
  private String questionName;

  /** 学生回答内容 */
  private String answer;

  /** 学生得分 */
  private Integer score;

  private Integer questionId;
}
