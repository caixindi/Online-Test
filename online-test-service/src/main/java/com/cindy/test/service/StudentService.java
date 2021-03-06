package com.cindy.test.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cindy.test.common.model.Student;
import com.cindy.test.common.model.dto.ChangePassDto;
import com.cindy.test.common.model.dto.QueryStudentDto;
import com.cindy.test.common.model.vo.StudentVo;
import java.util.Map;
import org.springframework.web.multipart.MultipartFile;

/**
 * 学生业务接口
 */
public interface StudentService extends IService<Student> {

  /**
   * 学生登录
   *
   * @param stuNumber   学生学号
   * @param stuPassword 学生密码
   * @return 学生信息
   */
  StudentVo login(String stuNumber, String stuPassword);

  /**
   * 学生修改密码
   *
   * @param dto 新的密码
   */
  void updatePassword(ChangePassDto dto);

  /**
   * 通过学号查询学生信息
   *
   * @param stuNumber 学号
   * @return 学生信息
   */
  Student selectByStuNumber(String stuNumber);

  /**
   * 分页查询学生
   *
   * @param page   分页信息
   * @param entity 模糊条件
   * @return 学生分页结果集
   */
  Map<String, Object> listPage(Page<Student> page, QueryStudentDto entity);

  /**
   * 通过 ID 查询学生详细信息
   *
   * @param id 学生 ID
   * @return 学生信息
   */
  StudentVo selectVoById(Integer id);

  /**
   * 通过专业 ID 查询学生数量
   *
   * @param majorId 专业ID
   * @return 学生数量
   */
  Integer selectCountByMajorId(Integer majorId);

  /**
   * 导入学生数据
   *
   * @param multipartFile /
   */
  void importStudentsExcel(MultipartFile multipartFile);
}
