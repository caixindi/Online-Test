package com.cindy.test.rest;

import com.cindy.test.common.base.R;
import com.cindy.test.core.annotation.Limit;
import com.cindy.test.util.service.CaptchaService;
import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 验证码 rest 控制器
 */
@RestController
@RequestMapping("/api/captcha")
public class CaptchaController {

  @Resource
  private CaptchaService captchaService;

  @GetMapping
  @Limit(key = "captcha", period = 10, count = 10, name = "验证码接口", prefix = "limit")
  public R get() {
    return R.successWithData(this.captchaService.getCaptcha());
  }
}
