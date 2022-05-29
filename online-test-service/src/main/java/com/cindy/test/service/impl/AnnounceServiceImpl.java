package com.cindy.test.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cindy.test.common.dao.AnnounceDAO;
import com.cindy.test.common.model.Announce;
import com.cindy.test.common.util.PageUtil;
import com.cindy.test.service.AnnounceService;
import java.util.Date;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 公告业务实现类
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class AnnounceServiceImpl extends ServiceImpl<AnnounceDAO, Announce>
    implements AnnounceService {

  private final AnnounceDAO announceDAO;

  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean save(Announce entity) {
    // 封装时间创建时间参数
    entity.setCreateTime(new Date());
    baseMapper.insert(entity);
    return true;
  }

  @Override
  public Map<String, Object> pageForAnnounce(Page<Announce> page) {
    Page<Announce> info = this.announceDAO.selectPage(page, null);
    return PageUtil.toPage(info);
  }
}
