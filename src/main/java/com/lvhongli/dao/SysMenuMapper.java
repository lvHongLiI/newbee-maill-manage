package com.lvhongli.dao;

import com.lvhongli.entity.SysMenu;
import com.lvhongli.pojo.MenuParam;
import com.lvhongli.pojo.MenuVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SysMenuMapper extends MyBaseMapper<SysMenu> {

    int deleteByIdOrPId(@Param("ids") Integer[] ids);

    List<SysMenu> find(MenuParam menuParam);

    List<MenuVo> getLevelMenu(Integer pid);

    List<Map> findByRoleIdExist(Integer rid);

    List<String> findNameByRid(Integer rid);

    List<SysMenu> findAll();

    String findByName(Integer id);
}
