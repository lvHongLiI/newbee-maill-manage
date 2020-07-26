package com.lvhongli.entity;

import lombok.Data;

import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Data
@Table(name = "sys_user")
public class SysRole {

    private Integer id;

    private String name;

    private List<SysMenu> menus=new ArrayList();
}
