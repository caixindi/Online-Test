package com.cindy.test.common.model.dto;

import com.cindy.test.common.base.BaseEntity;
import com.cindy.test.common.model.Score;
import com.cindy.test.common.model.Student;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 学生主观题答题记录数据传输bean
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
public class StuAnswerRecordDto extends BaseEntity {

  private Student student;
  private Score score;
  private List<StudentAnswerDto> records;
}
