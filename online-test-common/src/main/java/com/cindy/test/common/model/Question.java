package com.cindy.test.common.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 问题实体
 */
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Question {

  @TableId
  private Integer id;

  /**
   * 题目名称
   */
  private String questionName;

  /**
   * 选项a
   */
  private String optionA;

  /**
   * 选项b
   */
  private String optionB;

  /**
   * 选项c
   */
  private String optionC;

  /**
   * 选项d
   */
  private String optionD;

  /**
   * 题目类型id
   */
  private Integer typeId;

  /**
   * 题目答案
   */
  private String answer;

  /**
   * 课程id
   */
  private Integer courseId;

  /**
   * 题目难度：容易，中等，较难
   */
  private String difficulty;

  /**
   * 题目解析
   */
  private String remark;

  /**
   * 教师id
   */
  private Integer teacherId;

  /**
   * 题型名称
   */
  @JsonIgnore
  @TableField(exist = false)
  private String typeName;
}
