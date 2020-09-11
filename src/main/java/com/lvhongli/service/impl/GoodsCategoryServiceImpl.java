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
import com.lvhongli.dao.GoodsCategoryMapper;
import com.lvhongli.entity.GoodsCategory;
import com.lvhongli.pojo.GoodsCategoryVo;
import com.lvhongli.service.GoodsCategoryService;

import com.lvhongli.util.Result;
import com.lvhongli.util.StringUtil;
import com.lvhongli.util.SystemUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class GoodsCategoryServiceImpl implements GoodsCategoryService {

    @Autowired
    private GoodsCategoryMapper mapper;

    @Override
    public Result find(GoodsCategory category) {
        PageHelper.startPage(category.getOffset(),category.getLimit());
        List<GoodsCategoryVo> categories=mapper.find(category);
        return new Result(200,"查询成功",new PageInfo<>(categories));
    }

    @Override
    public Result save(GoodsCategory category) {
        int row=0;
        if (category.getId()==null){
            category.setCreateUser(SystemUtil.getSysUser().getId());
            category.setCreateTime(new Date());
            row=mapper.insert(category);
        }else {
            category.setUpdateUser(SystemUtil.getSysUser().getId());
            category.setUpdateTime(new Date());
            row=mapper.updateByPrimaryKeySelective(category);
        }
        return new Result(row==1?200:500,row==1?"保存成功!":"保存失败");
    }

    @Override
    public Result delete(Integer[] ids) {
        if (mapper.deleteAll(ids)!=0)
            return new Result(200,"删除成功！");
        return new Result(500,"删除失败！");
    }

    @Override
    public Integer getPid(Integer id) {
        Integer pid = mapper.getPid(id);
        return pid==null?0:pid;
    }

    @Override
    public List<GoodsCategoryVo> selectByPid(int pid) {
        return mapper.selectByPid(pid);
    }


    @Override
    public Result selectByCategory(Integer status, Integer pid) {
        Map<String,Object> map=new HashMap<>();
        if (status==null||status==pid){
            return new Result(201,"参数不能为空");
        }
        if (status==2){
            List<GoodsCategoryVo> twoCategorys =selectByPid(pid);
            map.put("twoCategorys",twoCategorys);
            pid= StringUtil.isNotEmpty(twoCategorys)?twoCategorys.get(0).getId():-1;
        }
        map.put("threeCategorys",selectByPid(pid));
        return new Result(200,"查询成功！",map);

    }
}
