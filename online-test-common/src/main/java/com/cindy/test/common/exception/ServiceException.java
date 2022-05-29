package com.cindy.test.common.exception;

/**
 * 统一业务层异常
 */
public class ServiceException extends RuntimeException {

  public ServiceException(String message) {
    super(message);
  }
}
