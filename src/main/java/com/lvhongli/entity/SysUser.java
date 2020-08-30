/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Table(name = "sys_user")
@Data
public class SysUser {

    @ApiModelProperty(value = "主键",example = "1231242432")
    @Id
    @GeneratedValue( generator = "JDBC",strategy= GenerationType.IDENTITY)
    private Integer id;

    @ApiModelProperty(value = "账号",example = "123")
    private String account;


    @ApiModelProperty(value = "密码",example = "afa")
    private String password;


    @ApiModelProperty(value = "用户名称",example = "顶级用户")
    private String name;

    @ApiModelProperty(value = "创建人",example = "嘿嘿")
    private Integer create_user;

    @ApiModelProperty(value = "创建时间",example = "2020-08-23 22:11:11")
    private Date create_time;

    @Transient
    @ApiModelProperty(value = "用户拥有角色",example = "admin,root")
    private String haveRole;

    @Transient
    @ApiModelProperty(value = "用户拥有角色(集合)",example = "admin,root")
    private List<Map> roles=new ArrayList<>();
}