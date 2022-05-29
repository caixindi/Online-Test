package com.cindy.test.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cindy.test.common.constant.SysConsts;
import com.cindy.test.common.dao.PaperFormDAO;
import com.cindy.test.common.exception.ServiceException;
import com.cindy.test.common.model.PaperForm;
import com.cindy.test.service.PaperFormService;
import com.cindy.test.service.PaperService;
import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 试卷模板服务实现类
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class PaperFormServiceImpl extends ServiceImpl<PaperFormDAO, PaperForm>
    implements PaperFormService {

  private final PaperService paperService;
  private final PaperFormDAO paperFormDAO;

  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean removeById(Serializable id) {
    // 调用通过ID查询试卷模板信息接口
    PaperForm form = this.paperFormDAO.selectById(id);
    // 如果 form 对象为空，说明模板不存在
    if (form == null) {
      throw new ServiceException("试卷模版不存在!");
    }
    // 查找是否有正在使用该模版的试卷，如果有，则不允许删除模版
    int count = this.paperService.countPaperByPaperFormId((int) id);
    // 如果试卷集合对象不为空，说明有试卷正在使用，则不能删除
    if (count > 0) {
      throw new ServiceException("试卷模版正在使用，不能删除该模版！");
    }
    // 至此可以安全删除，调用父级 removeById 方法删除
    baseMapper.deleteById(id);
    return true;
  }

  @Override
  public List<PaperForm> list() {
    List<PaperForm> list = baseMapper.selectList(null);
    // 过滤出类型1 的数据按模板
    return list.stream()
        // steam 流过滤模板类型
        .filter(e -> e.getType().equals(SysConsts.PaperForm.INSERT))
        // 形成新的 List 集合
        .collect(Collectors.toList());
  }
}
