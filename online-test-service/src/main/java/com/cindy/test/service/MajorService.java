package com.cindy.test.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cindy.test.common.model.Major;
import java.util.List;
import java.util.Map;
import org.springframework.web.multipart.MultipartFile;

public interface MajorService extends IService<Major> {

  /**
   * 分页查询专业信息
   *
   * @param page  分页信息
   * @param major 查询条件
   * @return 分页信息结果集
   */
  Map<String, Object> listPage(Page<Major> page, Major major);

  /**
   * 通过学院 ID 获取专业集合
   *
   * @param academyId 学院 ID
   * @return 集合信息
   */
  List<Major> listByAcademyId(Integer academyId);

  /**
   * 通过专业名称获取专业集合
   *
   * @param majorName 专业名称
   * @return 集合信息
   */
  List<Major> listByMajorName(String majorName);

  /**
   * 导入学生数据
   *
   * @param multipartFile /
   */
  void importMajorsExcel(MultipartFile multipartFile);
}
