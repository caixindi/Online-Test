package com.cindy.test.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cindy.test.common.dao.AcademyDAO;
import com.cindy.test.common.dao.MajorDAO;
import com.cindy.test.common.exception.ServiceException;
import com.cindy.test.common.model.Academy;
import com.cindy.test.common.model.Major;
import com.cindy.test.common.util.PageUtil;
import com.cindy.test.service.AcademyService;
import java.io.Serializable;
import java.util.Map;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 学院服务实现类
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class AcademyServiceImpl extends ServiceImpl<AcademyDAO, Academy> implements AcademyService {

  private final MajorDAO majorDAO;
  private final AcademyDAO academyDAO;

  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean removeById(Serializable id) {
    // 查询是否有专业于该ID的学院关联，存在的话不允许被删除
    // 这里使用 QueryWrapper 构造器构造查询条件
    LambdaQueryWrapper<Major> qw = new LambdaQueryWrapper<>();
    qw.eq(Major::getAcademyId, id);
    // 查询数量，如果为 0 说明不存在关联
    int count = this.majorDAO.selectCount(qw);
    if (count > 0) {
      throw new ServiceException("存在专业关联，不允许删除！");
    }
    // 不存在关联，允许删除
    baseMapper.deleteById(id);
    return true;
  }

  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean updateById(Academy entity) {
    // 检测学院名称
    if (this.selectByName(entity.getName()) != null) {
      throw new ServiceException("学院名称已存在");
    }
    baseMapper.updateById(entity);
    return true;
  }

  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean save(Academy entity) {
    // 检测学院名称
    if (this.selectByName(entity.getName()) != null) {
      throw new ServiceException("学院名称已存在");
    }
    baseMapper.insert(entity);
    return true;
  }

  @Override
  public Academy selectByName(String academyName) {
    LambdaQueryWrapper<Academy> qw = new LambdaQueryWrapper<>();
    qw.eq(Academy::getName, academyName);
    return this.academyDAO.selectOne(qw);
  }

  @Override
  public Map<String, Object> listPage(Page<Academy> page) {
    Page<Academy> pageInfo = this.academyDAO.selectPage(page, null);
    return PageUtil.toPage(pageInfo);
  }
}
