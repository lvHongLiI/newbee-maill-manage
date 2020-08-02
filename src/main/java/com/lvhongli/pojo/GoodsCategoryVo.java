package com.lvhongli.pojo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
public class GoodsCategoryVo {

    @ApiModelProperty(value = "主键",example = "1231242432")
    private Integer id;

    @ApiModelProperty(value = "分类名称",example = "呵呵")
    private String name;

    @ApiModelProperty(value = "父名称",example = "123")
    private String pName;

    @ApiModelProperty(value = "排序值",example = "1")
    private Byte sort;

    @ApiModelProperty(value = "创建人",example = "张三")
    private String createUser;

    @ApiModelProperty(value = "创建时间",example = "2020-07-25")
    private String createTime;

    @ApiModelProperty(value = "修改人",example = "呵呵")
    private String updateUser;

    @ApiModelProperty(value = "修改时间",example = "2020-07-25")
    private String updateTime;
}
