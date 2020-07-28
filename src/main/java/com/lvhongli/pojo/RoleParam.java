package com.lvhongli.pojo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class RoleParam extends Page {

    @ApiModelProperty(value = "角色名称",example = "heihei")
    private String roleName;
}
