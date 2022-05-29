package com.cindy.test.core.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Data
@Component
@PropertySource(value = {"classpath:application.properties"})
@ConfigurationProperties(prefix = "otp")
public class Props {

  private SysProperties sys = new SysProperties();
}
