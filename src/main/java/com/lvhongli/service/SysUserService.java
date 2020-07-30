/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.service;


import com.lvhongli.entity.SysUser;
import com.lvhongli.pojo.Page;
import com.lvhongli.util.Result;

public interface SysUserService {

    SysUser login(String userName, String password);

    /**
     * 获取用户信息
     *
     * @param loginUserId
     * @return
     */
    SysUser getUserDetailById(Integer loginUserId);

    /**
     * 修改当前登录用户的密码
     *
     * @param loginUserId
     * @param originalPassword
     * @param newPassword
     * @return
     */
    Result updatePassword(Integer loginUserId, String originalPassword, String newPassword);

    /**
     * 修改当前登录用户的名称信息
     *
     * @param loginUserId
     * @param loginUserName
     * @param nickName
     * @return
     */
    Boolean updateName(Integer loginUserId, String loginUserName, String nickName);

    /**
     *添加系统用户
     * @param user
     * @return
     */
    Result add(SysUser user);

    /**
     * 删除用户
     * @param ids
     * @return
     */
    Result delete(Integer[] ids);

    /**
     * 查询用户
     * @return
     * @param page
     */
    Result find(Page page);

    /**
     * 查询用户详情
     * @param id
     * @return
     */
    SysUser findById(Integer id);

    /**
     * 添加角色id
     * @param userId
     * @param roleIds
     * @return
     */
    Result addRoles(Integer userId, Integer[] roleIds);
}
