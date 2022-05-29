package com.cindy.test.common.exception;

/**
 * 无权限访问异常
 */
public class NoPermissionException extends RuntimeException {

  public NoPermissionException(String message) {
    super(message);
  }
}
