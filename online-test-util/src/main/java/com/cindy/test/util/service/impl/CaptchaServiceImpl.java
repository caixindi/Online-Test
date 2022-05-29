package com.cindy.test.util.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.cindy.test.common.exception.ServiceException;
import com.cindy.test.util.model.Captcha;
import com.cindy.test.util.service.CaptchaService;
import com.wf.captcha.ArithmeticCaptcha;
import java.util.concurrent.TimeUnit;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * 验证码实现
 */
@Service
@RequiredArgsConstructor
public class CaptchaServiceImpl implements CaptchaService {

  private final RedisTemplate<String, Object> redisTemplate;

  @Value("${otp.cache.captcha_prefix}")
  private String prefix;

  @Value("${otp.cache.captcha_expire}")
  private Long expire;

  @Override
  public Captcha getCaptcha() {
    // 算术类型 <a href="https://gitee.com/whvse/EasyCaptcha">
    ArithmeticCaptcha captcha = new ArithmeticCaptcha(90, 24);
    String key = prefix + IdUtil.fastSimpleUUID();
    redisTemplate.opsForValue().set(key, captcha.text(), expire, TimeUnit.SECONDS);
    return Captcha.builder().key(key).base64(captcha.toBase64()).build();
  }

  @Override
  public void validate(Captcha captcha) {
    String redisValue = (String) redisTemplate.opsForValue().get(captcha.getKey());
    if (StrUtil.isBlank(redisValue)) {
      throw new ServiceException("验证码过期");
    }
    redisTemplate.delete(captcha.getKey());
    if (!captcha.getText().equalsIgnoreCase(redisValue)) {
      throw new ServiceException("验证码错误");
    }
  }
}
