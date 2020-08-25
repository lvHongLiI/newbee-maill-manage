/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.dao;

import com.lvhongli.entity.GoodsCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface GoodsCategoryMapper extends MyBaseMapper<GoodsCategory> {

    /**
     * 查询方法
     * @param category
     * @return
     */
    List<GoodsCategory> find(GoodsCategory category);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    int deleteAll(@Param("ids") Integer[] ids);

    /**
     * 根据id查询名称
     * @param id
     * @return
     */
    String findNameById(Integer id);

    /**
     * 查询父id
     * @param id
     * @return
     */
    Integer getPid(Integer id);
}
