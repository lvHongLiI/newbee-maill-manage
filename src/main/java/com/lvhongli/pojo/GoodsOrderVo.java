package com.lvhongli.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Id;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Data
public class GoodsOrderVo {

    @ApiModelProperty(value = "主键",example = "1231242432")
    @Id
    private String id;//采用雪花算法生成id

    @ApiModelProperty(value = "交易流水号",example = "1231242432")
    private String tradeNumber;

    @ApiModelProperty(value = "平台用户",example = "1234")
    private String platformUser;

    @ApiModelProperty(value = "商户",example = "嘿嘿")
    private String goodsUser;

    @ApiModelProperty(value = "总价格",example = "123.43")
    private Double totalPrice;

    @ApiModelProperty(value = "订单地址",example = "")
    private String address;

    @ApiModelProperty(value = "状态 1待支付 2已支付 21支付异常  3已退款 31退款异常  4超时失效",example = "1")
    private String status;

    @ApiModelProperty(value = "配送状态：1 待配货 2 配货完成 3 已出库 4 运输中 5已验收 6已退货 7关闭订单",example = "1")
    private String deliveryStatus;

    @ApiModelProperty(value = "支付类型 1微信 2支付宝 3其他",example = "1")
    private String payType;

    @ApiModelProperty(value = "创建时间",example = "yyyy-MM-dd HH:mm:ss")
    private String createTime;

    @ApiModelProperty(value = "更新时间",example = "yyyy-MM-dd HH:mm:ss")
    private String updateTime;

}
