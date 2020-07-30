/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.dao;
import com.lvhongli.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface SysUserMapper extends MyBaseMapper<SysUser>{

 int deleteAll(@Param("ids") Integer[] ids);

    List<SysUser> find();

    /**
     * 根据账号查询用户信息
     * @param account
     * @return
     */
    SysUser findByName(String account);

    /**
     * 查询该用户拥有的菜单信息
     * @param userId
     * @return
     */
    Set<Integer> queryHaveMenuId(Integer userId);
}