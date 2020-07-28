package com.lvhongli.pojo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class MenuParam extends Page {

    @ApiModelProperty(value = "父id",example = "1")
    private Integer pid;

}
