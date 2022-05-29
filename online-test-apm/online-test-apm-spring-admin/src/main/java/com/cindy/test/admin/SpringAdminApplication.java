package com.cindy.test.admin;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

/**
 * Spring-Admin 服务监控系统启动器
 *
 * @author cindy
 * @since 2020/05/17 12:01
 */

@EnableAdminServer
@SpringBootApplication
public class SpringAdminApplication {

  public static void main(String[] args) {
    new SpringApplicationBuilder(SpringAdminApplication.class)
        .web(WebApplicationType.SERVLET)
        .run(args);
  }

}
