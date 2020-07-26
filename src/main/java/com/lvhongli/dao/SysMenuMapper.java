package com.lvhongli.dao;

import com.lvhongli.entity.SysMenu;
import com.lvhongli.pojo.MenuParam;

import java.util.List;

public interface SysMenuMapper extends MyBaseMapper<SysMenu> {

    int deleteByIdOrPId(Integer id);

    List<SysMenu> find(MenuParam menuParam);

    List<SysMenu> getOneLevelMenu();
}
