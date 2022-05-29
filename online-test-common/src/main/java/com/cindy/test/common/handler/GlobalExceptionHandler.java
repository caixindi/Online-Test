package com.cindy.test.common.handler;

import com.cindy.test.common.base.R;
import com.cindy.test.common.exception.LimitAccessException;
import com.cindy.test.common.exception.NoPermissionException;
import com.cindy.test.common.exception.ServiceException;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

  @ResponseBody
  @ExceptionHandler(NoPermissionException.class)
  public R handleNoPermissionException(NoPermissionException e) {
    return R.error(e.getMessage());
  }

  @ResponseBody
  @ExceptionHandler(LimitAccessException.class)
  public R handleLimitAccessException(LimitAccessException e) {
    return R.error(e.getMessage());
  }

  @ResponseBody
  @ExceptionHandler(ServiceException.class)
  public R handleServiceException(ServiceException e) {
    return R.error(e.getMessage());
  }

  /**
   * 处理所有接口数据验证异常
   */
  @ResponseBody
  @ExceptionHandler(BindException.class)
  public R handleBindException(BindException e) {
    StringBuilder message = new StringBuilder();
    List<FieldError> fieldErrors = e.getBindingResult().getFieldErrors();
    for (FieldError error : fieldErrors) {
      message.append(error.getDefaultMessage()).append("，");
    }
    message = new StringBuilder(message.substring(0, message.length() - 1));
    return R.error(message.toString());
  }
}
