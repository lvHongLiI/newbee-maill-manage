package com.lvhongli.pojo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class GoodsOrderItemParam extends Page{


    @ApiModelProperty(value = "订单id",example = "1")
    private String orderId;

}
