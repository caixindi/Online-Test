package com.cindy.test.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cindy.test.common.dao.AcademyDAO;
import com.cindy.test.common.dao.CourseDAO;
import com.cindy.test.common.dao.QuestionDAO;
import com.cindy.test.common.dao.TeacherDAO;
import com.cindy.test.common.exception.ServiceException;
import com.cindy.test.common.model.Course;
import com.cindy.test.common.model.Question;
import com.cindy.test.common.model.Teacher;
import com.cindy.test.common.model.dto.QueryCourseDto;
import com.cindy.test.common.util.PageUtil;
import com.cindy.test.service.CourseService;
import com.google.common.collect.Lists;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 课程服务实现类
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class CourseServiceImpl extends ServiceImpl<CourseDAO, Course> implements CourseService {

  private final QuestionDAO questionDAO;
  private final CourseDAO courseDAO;
  private final TeacherDAO teacherDAO;
  private final AcademyDAO academyDAO;


  @Override
  public List<Integer> listIdByTeacherId(Integer teacherId) {
    List<Course> courses = this.courseDAO.listByTeacherId(teacherId);
    // 将课程集合转为 ID 集合
    return Lists.transform(courses, Course::getId);
  }

  @Override
  public List<Course> listByTeacherId(Integer teacherId) {
    List<Course> courses = this.courseDAO.listByTeacherId(teacherId);
    // 为每一门课程设置教师信息
    for (Course course : courses) {
      // 切割教师id列表
      String tIds = course.getTeacherIds();
      String[] strIds = StrUtil.splitToArray(tIds, ',');
      StringBuilder names = new StringBuilder();
      StringBuilder workNumbers = new StringBuilder();
      for (String id : strIds) {
        Teacher res = this.teacherDAO.selectById(id);
        names.append(res.getName()).append(',');
        workNumbers.append(res.getWorkNumber()).append(',');
      }
      String b = names.toString();
      String c = workNumbers.toString();
      if (workNumbers.length() > 0) {
        b = b.substring(0, b.length() - 1);
        c = c.substring(0, b.length() - 1);
      }
      course.setNames(b);
      course.setWorkNumbers(c);
    }
    return courses;
  }

  @Override
  public Map<String, Object> listPage(Page<Course> page, QueryCourseDto entity) {
    if (entity.getTeacherId() != null) {
      List<Course> courses = this.courseDAO.listByTeacherId(entity.getTeacherId());
      // 过滤所属学院信息
      if (entity.getAcademyId() != null) {
        courses = courses.stream()
            .filter(course -> course.getAcademyId().equals(entity.getAcademyId())).collect(
                Collectors.toList());
      }
      // 课程名称模糊搜索
      if (StrUtil.isNotBlank(entity.getKey())) {
        courses = courses.stream()
            .filter(course -> course.getCourseName().contains(entity.getKey()))
            .collect(
                Collectors.toList());
      }
      // 统计集合总数
      int total = courses.size();
      // List 分页
      courses = PageUtil.toPage(page.getCurrent(), page.getSize(), courses);
      return PageUtil.toPage(courses, total);
    } else {
      // 模糊搜索条件
      LambdaQueryWrapper<Course> qw = new LambdaQueryWrapper<>();
      if (entity.getAcademyId() != null) {
        qw.eq(Course::getAcademyId, entity.getAcademyId());
      }
      if (StrUtil.isNotBlank(entity.getKey())) {
        qw.like(Course::getCourseName, entity.getKey());
      }
      Page<Course> pageInfo = this.courseDAO.selectPage(page, qw);
      return PageUtil.toPage(pageInfo);
    }
  }

  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean save(Course course) {
    baseMapper.insert(toSaveOrUpdate(course));
    return true;
  }

  @Override
  public boolean update(Course course) {
    baseMapper.updateById(toSaveOrUpdate(course));
    return true;
  }

  @Override
  public boolean removeById(Serializable id) {
    // 构造指定课程的试题数数量查询方法
    LambdaQueryWrapper<Question> qw = new LambdaQueryWrapper<>();
    qw.eq(Question::getCourseId, id);
    int count = this.questionDAO.selectCount(qw);
    // 如果数量大于0，不能删除该课程，直接抛出异常
    if (count > 0) {
      throw new ServiceException("课程存在试题关联，请删除后再尝试。");
    } else {
      baseMapper.deleteById(id);
      return true;
    }
  }

  @Override
  public Course getById(Serializable id) {
    Course course = baseMapper.selectById(id);
    // 为课程设置教师信息
    String teacherIds = course.getTeacherIds();
    String[] strIds = StrUtil.splitToArray(teacherIds, ',');
    StringBuilder workNumberSb = new StringBuilder();
    StringBuilder nameSb = new StringBuilder();
    for (String strId : strIds) {
      Teacher teacher = this.teacherDAO.selectById(strId);
      workNumberSb.append(teacher.getWorkNumber()).append(',');
      nameSb.append(teacher.getName()).append(',');
    }
    String res1 = workNumberSb.toString();
    res1 = res1.substring(0, res1.length() - 1);
    String res2 = nameSb.toString();
    res2 = res2.substring(0, res2.length() - 1);
    course.setWorkNumbers(res1);
    course.setNames(res2);
    // 设置学院信息
    course.setAcademy(this.academyDAO.selectById(course.getAcademyId()));
    return course;
  }

  private Course toSaveOrUpdate(Course course) {
    if (course.getNames() == null || course.getWorkNumbers() == null) {
      throw new ServiceException("教师信息不能为空");
    }

    String[] workNumbers = StrUtil.splitToArray(course.getWorkNumbers(), ',');
    String[] names = StrUtil.splitToArray(course.getNames(), ',');
    StringBuilder ids = new StringBuilder();
    for (int i = 0; i < workNumbers.length; i++) {
      LambdaQueryWrapper<Teacher> qw = new LambdaQueryWrapper<>();
      qw.eq(Teacher::getWorkNumber, workNumbers[i]).eq(Teacher::getName, names[i]);
      Teacher result = teacherDAO.selectOne(qw);
      if (result == null) {
        throw new ServiceException("教师信息有误，请确认后再试");
      } else {
        ids.append(result.getId()).append(',');
      }
    }
    String resIds = ids.toString();
    resIds = resIds.substring(0, resIds.length() - 1);
    course.setTeacherIds(resIds);
    return course;
  }
}
