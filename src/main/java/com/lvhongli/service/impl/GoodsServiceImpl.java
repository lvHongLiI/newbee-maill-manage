package com.lvhongli.service.impl;

import com.lvhongli.dao.GoodsMapper;
import com.lvhongli.pojo.GoodsParam;
import com.lvhongli.service.GoodsService;
import com.lvhongli.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public Result find(GoodsParam param) {
        return goodsMapper.find(param);
    }
}
