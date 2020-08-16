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

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @Title: OrderItem
 * @Package: com.lvhongli.entity
 * @Description: TODO(订单详情)
 * @Author: 吕宏力
 * @Date: 2020年08月15日 10:54
 * Copyright (c) ©1994-2019 Scjydz.com All Rights Reserved.
 **/
@Data
@Table(name = "goods_order_item")
public class GoodsOrderItem {

    @ApiModelProperty(value = "主键",example = "1231242432")
    @Id
    @GeneratedValue( generator = "JDBC",strategy= GenerationType.IDENTITY)
    private Long id;

    @ApiModelProperty(value = "商品名称",example = "华为手机")
    private String goodsName;

    @ApiModelProperty(value = "商品图片",example = "www.baidu.com")
    private String goodsImg;

    @ApiModelProperty(value = "销售价格",example = "51.2")
    private Double sellingPrice;

    @ApiModelProperty(value = "商品数量",example = "1")
    private Integer goodsCount;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "创建时间",example = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

}