package com.lvhongli.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvhongli.dao.GoodsMapper;
import com.lvhongli.entity.Goods;
import com.lvhongli.pojo.GoodsParam;
import com.lvhongli.pojo.GoodsVo;
import com.lvhongli.pojo.Page;
import com.lvhongli.service.GoodsService;
import com.lvhongli.util.IDGeneratorUtil;
import com.lvhongli.util.Result;
import com.lvhongli.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    private IDGeneratorUtil idGeneratorUtil=new IDGeneratorUtil();

    @Override
    public Result findAll(GoodsParam param) {
        PageHelper.startPage(param.getOffset(),param.getLimit());
        List<GoodsVo> list = goodsMapper.findAll(param);
        System.out.println("集合长度："+list.size());
        return new Result(200,"查询成功！",new PageInfo<>(list));
    }

    @Override
    public Goods findById(String id) {
        return goodsMapper.selectByPrimaryKey(id);
    }


    @Override
    public Result statusEdit(String[] ids, Byte status) {
        int rows=goodsMapper.statusEdit(ids,status);
        if (rows>0)
            return new Result(200,"修改成功！");
        return new Result(201,"修改失败！");
    }

    @Override
    public Result add(Goods goods) {
        int row=0;
        goods.setId(idGeneratorUtil.nextId());
        goods.setCreateTime(new Date());
        goods.setSellingNum(0);
        row=goodsMapper.insert(goods);
        return new Result(row==0?201:200,row==0?"添加失败":"添加成功！");
    }

    @Override
    public Result update(Goods goods) {
        int row=0;
        goods.setUpdateTime(new Date());
        row=goodsMapper.updateByPrimaryKeySelective(goods);
        return new Result(row==0?201:200,row==0?"修改失败":"修改成功！");
    }
}
