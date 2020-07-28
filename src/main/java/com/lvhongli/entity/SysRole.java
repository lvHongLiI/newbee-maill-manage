package com.lvhongli.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Data
@Table(name = "sys_role")
public class SysRole {

    @ApiModelProperty(value = "主键",example = "1231242432")
    @Id
    @GeneratedValue( generator = "JDBC",strategy= GenerationType.IDENTITY)
    private Integer id;

    @ApiModelProperty(value = "角色名称",example = "admin")
    private String roleName;

    @ApiModelProperty(value = "排序值",example = "1")
    private Integer sort;

    @Transient
    private  List<Map> menus=new ArrayList();
}
