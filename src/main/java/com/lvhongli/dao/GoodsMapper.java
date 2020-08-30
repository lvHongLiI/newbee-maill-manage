package com.lvhongli.dao;

import com.lvhongli.entity.Goods;
import com.lvhongli.pojo.GoodsParam;
import com.lvhongli.pojo.GoodsVo;
import com.lvhongli.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsMapper extends  MyBaseMapper<Goods>{

    List<GoodsVo> findAll(GoodsParam param);


    int statusEdit(@Param("ids") String[] ids, @Param("status")Byte status);
}
