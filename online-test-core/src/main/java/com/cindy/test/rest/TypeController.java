package com.cindy.test.rest;

import com.cindy.test.common.model.Type;
import com.cindy.test.core.annotation.Permissions;
import com.cindy.test.service.TypeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api/type")
public class TypeController {

  @Resource private TypeService typeService;

  @GetMapping
  @Permissions("type:list")
  public List<Type> list() {
    return this.typeService.list();
  }
}
