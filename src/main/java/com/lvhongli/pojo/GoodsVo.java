package com.lvhongli.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class GoodsVo {

    @ApiModelProperty(value = "商品编号（id）",example = "1232221313454354")
    private String id;

    @ApiModelProperty(value = "商品名称",example = "华为手机")
    private String name;

    @ApiModelProperty(value = "商品标题",example = "非常牛批的手机")
    private String title;

    @ApiModelProperty(value = "商品分类",example = "水果")
    private String category;

    @ApiModelProperty(value = "商品图片",example = "www.baidu.com")
    private String img;

    @ApiModelProperty(value = "商品简介",example = "此处省略一万字")
    private String synopsis;

    @ApiModelProperty(value = "商品描述",example = "此处省略一万字")
    private String detail;

    @ApiModelProperty(value = "商品价格",example = "45.4")
    private Double  price;

    @ApiModelProperty(value = "销售价格",example = "45.4")
    private Double sellingPrice;

    @ApiModelProperty(value = "商品库存数量",example = "123")
    private Integer num;

    @ApiModelProperty(value = "商品销售数量",example = "12")
    private Integer sellingNum;

    @ApiModelProperty(value = "状态 1 上架 2 下架",example = "1")
    private Byte status;

    @ApiModelProperty(value = "创建时间",example = "yyyy-MM-dd HH:mm:ss")
    private String createTime;

    @ApiModelProperty(value = "创建人",example = "张三")
    private String createUser;

    @ApiModelProperty(value = "修改时间",example = "yyyy-MM-dd HH:mm:ss")
    private String updateTime;

    @ApiModelProperty(value = "修改人",example = "张三")
    private String updateUser;
}
