package com.lvhongli.dao;

import org.apache.ibatis.annotations.Param;

public interface RoleMenuLinkMapper {

    int deleteById(@Param("column") String column, @Param("ids")Integer[] ids);

    int addAll(@Param("roleId") Integer roleId, @Param("menusIds") Integer[] menusIds);
}
