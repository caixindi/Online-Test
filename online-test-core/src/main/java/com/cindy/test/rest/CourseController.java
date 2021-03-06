package com.cindy.test.rest;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cindy.test.common.base.R;
import com.cindy.test.common.constant.SysConsts.Session;
import com.cindy.test.common.model.Admin;
import com.cindy.test.common.model.Course;
import com.cindy.test.common.model.dto.QueryCourseDto;
import com.cindy.test.common.util.HttpUtil;
import com.cindy.test.core.annotation.Limit;
import com.cindy.test.core.annotation.Permissions;
import com.cindy.test.service.CourseService;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/course")
public class CourseController {

  @Resource
  private CourseService courseService;

  @GetMapping("/teacher/{teacherId}")
  @Permissions("course:list")
  public List<Course> listByTeacherId(@PathVariable Integer teacherId) {
    return this.courseService.listByTeacherId(teacherId);
  }

  @GetMapping("/list")
  @Permissions("course:list")
  @Limit(key = "courseList", period = 5, count = 18, name = "课程搜索接口", prefix = "limit")
  public Map<String, Object> pageCourse(Page<Course> page, QueryCourseDto entity) {
    // 管理员才进行管理员端的判断
    Admin admin = (Admin) HttpUtil.getAttribute(Session.ADMIN);
    if (admin != null) {
      if (admin.getAcademyId() != null) {
        entity.setAcademyId(admin.getAcademyId());
      }
    }
    return this.courseService.listPage(page, entity);
  }

  /**
   * 添加课程
   *
   * @return 成功信息
   */
  @PostMapping("/save")
  @Permissions("course:save")
  public R newCourse(@Valid Course course) {
    this.courseService.save(course);
    return R.success();
  }

  /**
   * 更新课程
   *
   * @return 成功信息
   */
  @PostMapping("/update")
  public R updateCourse(Course course) {
    this.courseService.update(course);
    return R.success();
  }

  /**
   * 删除课程
   *
   * @param id 课程ID
   * @return 删除成功信息
   */
  @PostMapping("/delete/{id}")
  @Permissions("course:delete")
  public R delCourse(@PathVariable Integer id) {
    // 调用课程删除接口
    this.courseService.removeById(id);
    return R.success();
  }

  /**
   * 查看课程
   *
   * @param id 课程ID
   * @return 删除成功信息
   */
  @GetMapping("/{id}")
  public Course getCourse(@PathVariable Integer id) {
    return this.courseService.getById(id);
  }
}
