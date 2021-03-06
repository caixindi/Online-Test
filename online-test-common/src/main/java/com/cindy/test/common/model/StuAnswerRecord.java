package com.cindy.test.common.model;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 学生主观题答题记录实体类
 */
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Data
public class StuAnswerRecord {

  @TableId
  private Integer id;

  /**
   * 试卷id
   */
  private Integer paperId;

  /**
   * 学生id
   */
  private Integer stuId;

  /**
   * 题目id
   */
  private Integer questionId;

  /**
   * 题目答案
   */
  private String answer;

  /**
   * 题目得分
   */
  private Integer score;
}
