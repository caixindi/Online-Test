package com.cindy.test.common.model.vo;

import com.cindy.test.common.model.Course;
import com.cindy.test.common.model.Question;
import com.cindy.test.common.model.Teacher;
import com.cindy.test.common.model.Type;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class QuestionVo extends Question {

  private Course course;

  private Type type;

  private Teacher teacher;
}
