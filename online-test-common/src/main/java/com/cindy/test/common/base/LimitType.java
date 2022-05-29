package com.cindy.test.common.base;

/**
 * 接口限流类型枚举
 */
public enum LimitType {
  /** 传统类型 */
  CUSTOMER,
  /** 根据 IP地址限制 */
  IP
}
