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
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Table;
import java.util.Date;

@Data
@Table(name = "goods")
public class Goods {

    @ApiModelProperty(value = "商品编号（id）",example = "1232221313454354")
    private String id;

    @ApiModelProperty(value = "商品名称",example = "华为手机")
    private String goodsName;

    @ApiModelProperty(value = "商品标题",example = "非常牛批的手机")
    private String title;

    @ApiModelProperty(value = "商品分类id",example = "1")
    private Integer categoryId;

    @ApiModelProperty(value = "商品图片",example = "www.baidu.com")
    private String goodsImg;

    @ApiModelProperty(value = "商品简介",example = "此处省略一万字")
    private String goodsSynopsis;

    @ApiModelProperty(value = "商品价格",example = "45.4")
    private Double  goodsPrice;

    @ApiModelProperty(value = "销售价格",example = "45.4")
    private Double sellingPrice;

    @ApiModelProperty(value = "数量",example = "123")
    private Integer count;

    @ApiModelProperty(value = "状态 1 上架 2 下架",example = "1")
    private Byte status;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "创建时间",example = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @ApiModelProperty(value = "创建人",example = "张三")
    private Integer createUser;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "修改时间",example = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    @ApiModelProperty(value = "修改人",example = "张三")
    private Integer updateUser;

}