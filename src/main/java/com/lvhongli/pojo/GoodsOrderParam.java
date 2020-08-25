package com.lvhongli.pojo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class GoodsOrderParam extends Page{

    @ApiModelProperty(value = "订单id",example = "1")
    private String orderId;

    @ApiModelProperty(value = "状态 1待支付 2已支付 21支付异常  3已退款 31退款异常  4超时失效",example = "1")
    private Byte status;

    @ApiModelProperty(value = "配送状态：1 待配货 2 配货完成 3 已出库 4 运输中 5已验收 6已退货 7关闭订单",example = "1")
    private Byte deliveryStatus;

    @ApiModelProperty(value = "支付类型 1微信 2支付宝 3其他",example = "1")
    private Byte payType;

}
