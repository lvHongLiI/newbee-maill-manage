package com.lvhongli.dao;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * @Title: MyBaseMapper.java
 * @Package com.amt.dao
 * @Description: TODO(mapper基础接口，所有的业务mapper都需要继承此接口)
 * @author 江伟
 * @date 2019年7月3日 上午10:38:25
 * Copyright (c) ©1994-2019 Scjydz.com All Rights Reserved.
 */
public interface MyBaseMapper<T> extends Mapper<T>, MySqlMapper<T> {

}
