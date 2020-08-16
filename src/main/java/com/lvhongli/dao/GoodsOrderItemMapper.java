package com.lvhongli.dao;


import com.lvhongli.entity.GoodsOrderItem;
import com.lvhongli.pojo.GoodsOrderItemVo;

import java.util.List;

public interface GoodsOrderItemMapper extends MyBaseMapper<GoodsOrderItem>  {


    List<GoodsOrderItemVo> selectOrderItem(String orderId);
}
