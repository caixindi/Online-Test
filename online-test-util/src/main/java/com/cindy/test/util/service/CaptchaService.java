package com.cindy.test.util.service;

import com.cindy.test.util.model.Captcha;

/**
 * 验证码业务
 *
 * @author chachae
 * @since 2020/3/13 11:26
 */
public interface CaptchaService {

  /**
   * 生成验证码
   *
   * @return 验证码信息
   */
  Captcha getCaptcha();

  /**
   * 验证码校验
   */
  void validate(Captcha captcha);
}
