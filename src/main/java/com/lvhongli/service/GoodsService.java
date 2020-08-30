package com.lvhongli.service;

import com.lvhongli.entity.Goods;
import com.lvhongli.pojo.GoodsParam;
import com.lvhongli.util.Result;

public interface GoodsService {

    /**
     * 查询商品信息
     * @param param
     * @return
     */
    Result findAll(GoodsParam param);


    Goods findById(String id);

    /**
     * 修改商品状态
     * @param ids
     * @param status
     * @return
     */
    Result statusEdit(String[] ids, Byte status);



    /**
     * 添加商品信息
     * @param goods
     * @return
     */
    Result add(Goods goods);


    /**
     * 修改商品信息
     * @param goods
     * @return
     */
    Result update(Goods goods);
}
