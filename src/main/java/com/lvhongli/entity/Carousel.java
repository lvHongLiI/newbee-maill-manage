/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lvhongli.pojo.Page;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Data
public class Carousel  extends Page {
    @ApiModelProperty(value = "主键",example = "1231242432")
    @Id
    @GeneratedValue( generator = "JDBC",strategy= GenerationType.IDENTITY)
    private Integer id;

    @ApiModelProperty(value = "轮播图地址",example = "www，baidu.com")
    private String carouselUrl;

    @ApiModelProperty(value = "跳转地址",example = "www.baidu.com")
    private String redirectUrl;

    @ApiModelProperty(value = "排序值",example = "1")
    private Byte sort;

    @ApiModelProperty(value = "状态",example = "1 新增, 2 启用，3，关闭")
    private String status;

    @ApiModelProperty(value = "开始日期",example = "2020-07-27")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private  Date startDate;

    @ApiModelProperty(value = "结束时间",example = "2020-07-27")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private  Date endDate;

    @ApiModelProperty(value = "创建人",example = "张三")
    private Integer createUser;

    @ApiModelProperty(value = "创建时间",example = "2020-07-25")
    private Date createTime;

    @ApiModelProperty(value = "修改人",example = "呵呵")
    private Integer updateUser;

    @ApiModelProperty(value = "修改时间",example = "2020-07-25")
    private Date updateTime;
}