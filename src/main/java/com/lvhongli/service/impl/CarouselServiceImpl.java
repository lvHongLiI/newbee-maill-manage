/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvhongli.dao.CarouselMapper;
import com.lvhongli.entity.Carousel;
import com.lvhongli.pojo.CarouselVo;
import com.lvhongli.service.CarouselService;
import com.lvhongli.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarouselServiceImpl implements CarouselService {

    @Autowired
    private CarouselMapper carouselMapper;

    @Override
    public Result find(Carousel carousel) {
        PageHelper.startPage(carousel.getOffset(),carousel.getLimit());
        List<CarouselVo> list=carouselMapper.find(carousel);
        return new Result(200,"查询成功!",new PageInfo(list));
    }

    @Override
    public Result add(Carousel carousel) {
       if ( carouselMapper.insert(carousel)==1)
           return new Result(200,"添加成功！");
        return new Result(500,"添加失败！");
    }

    @Override
    public Result update(Carousel carousel) {
        if ( carouselMapper.updateByPrimaryKeySelective(carousel)==1)
            return new Result(200,"修改成功！");
        return new Result(500,"修改失败！");
    }

    @Override
    public Result delete(Integer[] ids) {
        if (carouselMapper.deleteAll(ids)!=0)
            return new Result(200,"删除成功！");
        return new Result(500,"删除失败！");
    }

    @Override
    public Result statusEdit(Integer[] ids, String status) {
        StringBuilder builder=new StringBuilder();
        for (Integer id : ids) {
            Carousel carousel = carouselMapper.selectByPrimaryKey(id);
            if (carousel==null){
                builder.append("id：").append(id).append(" 找不到该轮播图\n");
            }else {
                if ("2".equals(status)&&!carousel.getStatus().equals("1"))
                    builder.append("id：").append(id).append(" 必须是新增状态才能启用\n");
                else if ("3".equals(status)&&!carousel.getStatus().equals("2")&&!carousel.getStatus().equals("1"))
                    builder.append("id：").append(id).append(" 必须是新增或启用状态状态才能关闭\n");
                else {
                    if (carouselMapper.statusEdit(id,status)!=1)
                        builder.append("id：").append(id).append(" 操作失败\n");
                }
            }
        }

        if (builder.length()==0)
            builder.append("操作成功!");
        return new Result(200,builder.toString());

    }
}
