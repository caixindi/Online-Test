package com.cindy.test.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cindy.test.common.dao.TypeDAO;
import com.cindy.test.common.model.Type;
import com.cindy.test.service.TypeService;
import org.springframework.stereotype.Service;

/**
 * 试题类型服务实现类
 */
@Service
public class TypeServiceImpl extends ServiceImpl<TypeDAO, Type> implements TypeService {

}
