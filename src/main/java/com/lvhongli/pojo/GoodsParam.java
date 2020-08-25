package com.lvhongli.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class GoodsParam extends  Page {

    @ApiModelProperty(value = "商品名称",example = "华为手机")
    private String goodsName;

    @ApiModelProperty(value = "商品标题",example = "非常牛批的手机")
    private String title;

    @ApiModelProperty(value = "商品分类id",example = "1")
    private Integer categoryId;

    @ApiModelProperty(value = "状态 1 上架 2 下架",example = "1")
    private Byte status;

}
