package com.lvhongli.dao;

import com.lvhongli.entity.GoodsOrder;
import com.lvhongli.pojo.GoodsOrderParam;
import com.lvhongli.pojo.GoodsOrderVo;


import java.util.List;

public interface GoodsOrderMapper extends MyBaseMapper<GoodsOrder> {

    /**
     * 查询方法
     * @param orderParam
     * @return
     */
    List<GoodsOrderVo> find(GoodsOrderParam orderParam);
}
