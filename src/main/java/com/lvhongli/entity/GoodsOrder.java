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
import java.math.BigDecimal;
import java.util.Date;
/**
 * @Title: OrderItem
 * @Package: com.lvhongli.entity
 * @Description: TODO(订单表)
 * @Author: 吕宏力
 * @Date: 2020年08月15日 10:54
 * Copyright (c) ©1994-2019 Scjydz.com All Rights Reserved.
 **/
@Data
@Table(name = "goods_order")
public class GoodsOrder {

    @ApiModelProperty(value = "主键",example = "1231242432")
    @Id
    private String id;//采用雪花算法生成id

    @ApiModelProperty(value = "交易流水号",example = "1231242432")
    private String tradeNumber;

    @ApiModelProperty(value = "平台用户id",example = "1234")
    private String platformUserId;

    @ApiModelProperty(value = "总价格",example = "123.43")
    private Double totalPrice;

    @ApiModelProperty(value = "订单地址",example = "")
    private String address;

    @ApiModelProperty(value = "状态 1待支付 2已支付 21支付异常  3已退款 31退款异常  4超时失效",example = "1")
    private Byte status;

    @ApiModelProperty(value = "配送状态：1 待配货 2 配货完成 3 已出库 4 运输中 5已验收 6已退货 7关闭订单",example = "1")
    private Byte deliveryStatus;

    @ApiModelProperty(value = "支付类型 1微信 2支付宝 3其他",example = "1")
    private Byte payType;

    @ApiModelProperty(value = "扩展字段",example = "  ")
    private String ext;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "创建时间",example = "yyyy-MM-dd HH:mm:ss")
    private Date CreateTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "更新时间",example = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

}