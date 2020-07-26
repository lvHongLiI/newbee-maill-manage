package com.lvhongli.pojo;

import lombok.Data;

@Data
public class MenuParam extends Page {

    private String name;

    private Integer pid;

    private String accessUrl;
}
