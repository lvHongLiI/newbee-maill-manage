package com.lvhongli.service;

import com.lvhongli.entity.SysRole;
import com.lvhongli.pojo.RoleParam;
import com.lvhongli.util.Result;

public interface SysRoleService {

    Result findAll(RoleParam role);

    
    Result add(SysRole role);

    Result delete(Integer[] ids);

    Result update(SysRole role);

    Result addMenu(Integer roleId, Integer[] menusIds);

    Result findById(Integer id);
}
