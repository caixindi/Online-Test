package com.cindy.test.common.model;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 试卷题目类型信息实体
 */
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PaperForm {

  @TableId
  private Integer id;

  /**
   * 单选题数目
   */
  private String qChoiceNum;

  /**
   * 单选题分数
   */
  private String qChoiceScore;

  /**
   * 多选题数目
   */
  private String qMulChoiceNum;

  /**
   * 多选题分数
   */
  private String qMulChoiceScore;

  /**
   * 判断题数目
   */
  private String qTofNum;

  /**
   * 判断题分数
   */
  private String qTofScore;

  /**
   * 填空题数目
   */
  private String qFillNum;

  /**
   * 填空题分数
   */
  private String qFillScore;

  /**
   * 简答题数目
   */
  private String qSaqNum;

  /**
   * 简答题分数
   */
  private String qSaqScore;

  /**
   * 编程题数目
   */
  private String qProgramNum;

  /**
   * 编程题分数
   */
  private String qProgramScore;

  /**
   * 导入题生成的 = 1，模板页面增加的 = 0
   */
  private Integer type;
}
