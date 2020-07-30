/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvhongli.dao.SysRoleMapper;
import com.lvhongli.dao.SysUserMapper;
import com.lvhongli.dao.UserRoleLinkMapper;
import com.lvhongli.entity.SysUser;
import com.lvhongli.pojo.Page;
import com.lvhongli.service.SysUserService;
import com.lvhongli.util.MD5Util;
import com.lvhongli.util.Result;
import com.lvhongli.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class SysServiceImpl implements SysUserService {

    @Resource
    private SysUserMapper mapper;

    @Autowired
    private UserRoleLinkMapper userRoleLinkMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Override
    public SysUser login(String account, String password) {
        //1.根据账号查询是否存在该用户
        SysUser user=mapper.findByName(account);
        if (user==null)
            return null;
        //2.判断密码是否一致
        if (user.getPassword().equals(MD5Util.md5(password,user.getSlat()))){
            return user;
        }
        return null;
    }

    @Override
    public SysUser getUserDetailById(Integer loginUserId) {
        return mapper.selectByPrimaryKey(loginUserId);
    }

    @Override
    public Result updatePassword(Integer loginUserId, String pastPassword, String newPassword) {
        SysUser adminUser = mapper.selectByPrimaryKey(loginUserId);
        //当前用户非空才可以进行更改
        if (adminUser != null) {
            pastPassword= MD5Util.md5(pastPassword, adminUser.getSlat());
            //比较原密码是否正确
            if (pastPassword.equals(adminUser.getPassword())) {
                //设置新密码并修改
                adminUser.setPassword(MD5Util.md5(newPassword,adminUser.getSlat()));
                if (mapper.updateByPrimaryKeySelective(adminUser) > 0) {
                    //修改成功则返回true
                    return new Result(200,"修改成功！");
                }
            }
        }
        return new Result(500,"修改失败！");
    }

    @Override
    public Boolean updateName(Integer loginUserId, String loginUserName, String nickName) {
        SysUser adminUser = mapper.selectByPrimaryKey(loginUserId);
        //当前用户非空才可以进行更改
        if (adminUser != null) {
            //设置新名称并修改
            adminUser.setAccount(loginUserName);
            adminUser.setName(nickName);
            if (mapper.updateByPrimaryKeySelective(adminUser) > 0) {
                //修改成功则返回true
                return true;
            }
        }
        return false;
    }

    @Override
    public Result add(SysUser user) {
        user.setSlat(MD5Util.getRandomNumber());
        user.setPassword(MD5Util.md5(user.getPassword(),user.getSlat()));
        if (mapper.insert(user)==1)
            return new Result(200,"添加成功!");
        return new Result(500,"添加失败");
    }

    @Override
    public Result delete(Integer[] ids) {
        //1.删除系统用户
        mapper.deleteAll(ids);
        //2.删除用户角色中间表
        userRoleLinkMapper.deleteById("user_id",ids);
        return new Result(200,"删除成功!");
    }

    @Override
    public Result find(Page page) {
        PageHelper.startPage(page.getOffset(),page.getLimit());
        List<SysUser> users=mapper.find();
        if (StringUtil.isNotEmpty(users)){
            users.stream().forEach(s->{
                s.setHaveRole(roleMapper.findNameByUid(s.getId()).toString().replaceAll("\\[|\\]",""));
            });
        }
        return new Result(200,"查询成功！",new PageInfo(users));
    }


    @Override
    public SysUser findById(Integer id) {
        SysUser user = mapper.selectByPrimaryKey(id);
        if (user==null)
            return null;
        //拿到用户有的角色和没有的角色。
        List<Map> list=roleMapper.queryExistRole(id);
        if (StringUtil.isNotEmpty(list))
            user.setRoles(list);
        return user;
    }

    @Override
    public Result addRoles(Integer userId, Integer[] roleIds) {
        //1.先删除之前的角色
        try {
            userRoleLinkMapper.deleteById("user_id",new Integer[]{userId});
            userRoleLinkMapper.addAll(userId,roleIds);
            return new Result(200,"添加成功！");
        }catch (Exception e){
            e.printStackTrace();
            return new Result(500,"添加失败！");
        }

    }

    ;
}
