package com.cindy.test.common.model.dto;

import javax.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
@Data
public class LoginDto {

  @NotBlank(message = "用户名{required}")
  private String username;

  @NotBlank(message = "密码{required}")
  private String password;
}
