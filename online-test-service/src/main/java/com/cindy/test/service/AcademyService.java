package com.cindy.test.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cindy.test.common.model.Academy;

import java.util.Map;

/**
 * 学院表服务接口
 */
public interface AcademyService extends IService<Academy> {

  /**
   * 通过学院名称查询学院
   *
   * @param academyName 学院名称
   * @return 学院信息
   */
  Academy selectByName(String academyName);

  /**
   * 分页查询学院信息
   *
   * @param page 分页条件
   * @return 分页信息
   */
  Map<String, Object> listPage(Page<Academy> page);
}
