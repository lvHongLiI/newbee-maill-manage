package com.lvhongli.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Data
public class GoodsOrderItemVo {

    @ApiModelProperty(value = "主键",example = "1231242432")
    private String id;

    @ApiModelProperty(value = "订单id",example = "1231242432")
    private String orderId;

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
