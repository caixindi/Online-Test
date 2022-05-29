package com.cindy.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 登录模块控制层
 */
@Controller
public class LoginModuleController {

  /**
   * Login string.
   *
   * @return the string
   */
  @GetMapping({"/", "/login"})
  public String login() {
    return "/auth/login";
  }
}
