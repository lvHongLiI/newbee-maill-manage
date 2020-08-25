/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.service;


import com.lvhongli.entity.GoodsCategory;
import com.lvhongli.pojo.GoodsCategoryVo;
import com.lvhongli.util.Result;

import java.util.List;

public interface GoodsCategoryService {

    /**
     * 查询方法
     * @param param
     * @return
     */
    Result find(GoodsCategory param);

    /**
     * 保存方法
     * @param category
     * @return
     */
    Result save(GoodsCategory category);

    /**
     * 删除方法
     * @param ids
     * @return
     */
    Result delete(Integer[] ids);


    Integer getPid(Integer id);

    /**
     *
     * @param pid 根据pid查询分类列表
     * @return
     */
    List<GoodsCategoryVo> selectByPid(int pid);
}
