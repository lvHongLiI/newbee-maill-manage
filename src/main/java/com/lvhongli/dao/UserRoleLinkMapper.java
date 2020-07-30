package com.lvhongli.dao;

import org.apache.ibatis.annotations.Param;

public interface UserRoleLinkMapper {

    int deleteById(@Param("column") String column, @Param("ids")Integer[] ids);

    int addAll(@Param("userId") Integer userId, @Param("roleIds") Integer[] roleId);
}
