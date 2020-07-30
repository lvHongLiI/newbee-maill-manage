package com.lvhongli.dao;

import com.lvhongli.entity.SysRole;
import com.lvhongli.pojo.RoleParam;
import com.lvhongli.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SysRoleMapper extends MyBaseMapper<SysRole> {

    List<SysRole> findAll(RoleParam role);

    int deleteAll(@Param("ids") Integer[] ids);


    SysRole findById(Integer id);


    List<String> findNameByUid(Integer id);

    List<Map> queryExistRole(Integer id);
}
