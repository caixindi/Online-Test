package com.cindy.test.core.job;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cindy.test.common.constant.SysConsts;
import com.cindy.test.common.dao.PaperDAO;
import com.cindy.test.common.model.Paper;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 定时任务
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class PaperStateChangeJob {

  private final PaperDAO paperDAO;

  /**
   * 定时任务，给结束考试的试卷进行状态改变，每 2 小时执行一次
   */
  @Scheduled(cron = "0 0 0/2 * * ?")
  public void run() {
    log.info("执行考试状态检查任务");
    // 获取所有正式考试，且状态为未开始的试卷集合
    LambdaQueryWrapper<Paper> qw = new LambdaQueryWrapper<>();
    qw.eq(Paper::getPaperType, SysConsts.Paper.PAPER_TYPE_FORMAL);
    qw.eq(Paper::getPaperState, SysConsts.Paper.PAPER_STATE_START);
    List<Paper> paperList = paperDAO.selectList(qw);
    // 过滤出已经结束的试卷集合
    paperList = paperList.stream()
        .filter(Paper::isEnd)
        .collect(Collectors.toList());
    // 判断后批量执行更新
    if (CollUtil.isNotEmpty(paperList)) {
      for (Paper paper : paperList) {
        // 改变所有考试时间已过期且状态仍为未开始的试卷状态（更改为"已结束"）
        paper.setPaperState(SysConsts.Paper.PAPER_STATE_END);
        paper.setBeginTime(null);
        paper.setEndTime(null);
        paperDAO.updateById(paper);
        log.info("试卷:[{}] 状态被修改:[{}]", paper.getPaperName(), paper.getPaperState());
      }
    }
  }
}
