package com.lvhongli.service;


import com.lvhongli.entity.SysMenu;
import com.lvhongli.pojo.MenuParam;
import com.lvhongli.util.Result;

public interface SysMenuService {

    /**
     * 增加方法
     * @param menu
     * @return
     */
    Result add(SysMenu menu);

    /**
     * 删除方法
     * @param id
     * @return
     */
    Result delete(Integer id);


    /**
     * 修改
     * @param menu
     * @return
     */
    Result update(SysMenu menu);

    /**
     * 条件查询
     * @param menuParam
     * @return
     */
    Result find(MenuParam menuParam);

    /**
     * 获取一级菜单
     * @return
     */
    Result getOneLevelMenu();

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Result findById(Integer id);
}
