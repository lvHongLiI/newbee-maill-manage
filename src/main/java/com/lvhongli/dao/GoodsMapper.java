package com.lvhongli.dao;

import com.lvhongli.entity.Goods;
import com.lvhongli.pojo.GoodsParam;
import com.lvhongli.util.Result;

public interface GoodsMapper extends  MyBaseMapper<Goods>{

    Result find(GoodsParam param);
}
