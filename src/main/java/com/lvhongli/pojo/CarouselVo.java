package com.lvhongli.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Data
public class CarouselVo {

    @ApiModelProperty(value = "主键",example = "1231242432")
    private Integer id;

    @ApiModelProperty(value = "轮播图地址",example = "呵呵")
    private String carouselUrl;

    @ApiModelProperty(value = "跳转地址",example = "www.baidu.com")
    private String redirectUrl;

    @ApiModelProperty(value = "排序值",example = "1")
    private Byte sort;

    @ApiModelProperty(value = "状态",example = "1 新增, 2 启用，3，关闭,4 过期")
    private String status;

    @ApiModelProperty(value = "开始日期",example = "2020-07-27")
    private  String startDate;

    @ApiModelProperty(value = "结束时间",example = "2020-07-27")
    private  String endDate;

    @ApiModelProperty(value = "创建人",example = "张三")
    private String createUser;

    @ApiModelProperty(value = "创建时间",example = "2020-07-25")
    private String createTime;

    @ApiModelProperty(value = "修改人",example = "呵呵")
    private String updateUser;

    @ApiModelProperty(value = "修改时间",example = "2020-07-25")
    private String updateTime;
}
