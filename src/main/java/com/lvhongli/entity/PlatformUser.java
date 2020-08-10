package com.lvhongli.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@Table(name = "platform_user")
public class PlatformUser {

    @ApiModelProperty(value = "主键",example = "1231242432")
    @Id
    private Integer id;

    @ApiModelProperty(value = "第三方开放标识（微信，支付宝）",example = "1312")
    private String openId;

    @ApiModelProperty(value = "账号",example = "1233")
    private String account;

    @ApiModelProperty(value = "昵称",example = "嘿嘿")
    private String name;

    @ApiModelProperty(value = "密码",example = "123132")
    private String password;

    @ApiModelProperty(value = "密码盐",example = "12312222")
    private String salt;

    @ApiModelProperty(value = "手机号",example = "13404034390")
    private String phone;

    @ApiModelProperty(value = "头像",example = "www.baidu.com")
    private String headUrl;

    @ApiModelProperty(value = "状态",example = "0 禁用  1 启用")
    private Byte status;

    @ApiModelProperty(value = "用户类型",example = "1 平台用户, 2 微信  3 支付宝")
    private Byte type;

    @ApiModelProperty(value = "创建时间",example = "2020-09-21 12:11:11")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;

}
