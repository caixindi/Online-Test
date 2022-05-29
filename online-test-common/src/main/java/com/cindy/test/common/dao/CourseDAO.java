package com.cindy.test.common.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cindy.test.common.model.Course;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


/**
 * 课程 Mapper 接口
 */
public interface CourseDAO extends BaseMapper<Course> {

  @Select("select * from course where FIND_IN_SET(#{teacherId} ,teacher_ids)")
  List<Course> listByTeacherId(@Param("teacherId") Integer teacherId);
}
