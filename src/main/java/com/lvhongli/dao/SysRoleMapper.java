package com.lvhongli.dao;

import com.lvhongli.entity.SysRole;
import com.lvhongli.pojo.RoleParam;
import com.lvhongli.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysRoleMapper extends MyBaseMapper<SysRole> {

    List<SysRole> findAll(RoleParam role);

    int deleteAll(@Param("ids") Integer[] ids);


    SysRole findById(Integer id);


}
