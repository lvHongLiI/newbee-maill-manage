package com.lvhongli.entity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.lang.NonNull;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Table(name = "sys_user")
public class SysMenu {

    @ApiModelProperty(value = "主键",example = "1231242432")
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "菜单名",example = "用户管理")
    @NonNull
    private String name;

    @ApiModelProperty(value = "访问路径",example = "/aa/dd")
    private String accessUrl;

    @ApiModelProperty(value = "父id",example = "12312321")
    @NonNull
    private Integer pId;

    @ApiModelProperty(value = "子类",example = "1231")
    @Transient
    private List<SysMenu> children=new ArrayList<>();
}
