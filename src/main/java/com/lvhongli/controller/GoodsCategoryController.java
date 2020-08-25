/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.controller;
import com.lvhongli.entity.GoodsCategory;
import com.lvhongli.entity.SysUser;
import com.lvhongli.service.GoodsCategoryService;

import com.lvhongli.util.Result;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import java.util.TreeSet;


/**
 * @author 13
 * @qq交流群 796794009
 * @email 2449207463@qq.com
 * @link https://github.com/newbee-ltd
 */
@Controller
@RequestMapping("/goodsCategory")
@Api(tags ="商品分类管理")
public class GoodsCategoryController {

    @Autowired
    private GoodsCategoryService service;


    @GetMapping({"","/index"})
    public String index(HttpServletRequest request,Integer pid){

        if (pid==null)
            pid=0;

        Integer backId=0;
        if (pid>0){//说明有该id有父id
            backId=service.getPid(pid);
        }

        request.setAttribute("pid",pid);
        request.setAttribute("backId",backId);
        return "admin/goods_category";
    }

    @GetMapping("/find")
    @ResponseBody
    public Result find(GoodsCategory category){
       return service.find(category);
    }

    @PostMapping("/save")
    @ResponseBody
    public Result add(@RequestBody GoodsCategory category,HttpServletRequest request){
        SysUser user = (SysUser) request.getSession().getAttribute("user");
        if (category.getId()!=null){
            category.setUpdateUser(user.getId());
        }else {
            category.setCreateUser(user.getId());
        }
        return service.save(category);
    }


    @PostMapping("/delete")
    @ResponseBody
    public Result delete(@RequestBody Integer[] ids){
        return service.delete(ids);
    }



}