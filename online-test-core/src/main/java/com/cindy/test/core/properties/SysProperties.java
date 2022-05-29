package com.cindy.test.core.properties;

import lombok.Data;

@Data
public class SysProperties {

  private String anonUrl;

  private String loginUrl;

  private String logoutUrl;

  private String indexUrl;

  private String unauthorizedUrl;
}
