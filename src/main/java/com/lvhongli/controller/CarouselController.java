/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.controller;

import com.lvhongli.entity.Carousel;
import com.lvhongli.service.CarouselService;

import com.lvhongli.util.Result;
import com.lvhongli.util.SystemUtil;
import io.swagger.annotations.Api;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author 13
 * @qq交流群 796794009
 * @email 2449207463@qq.com
 * @link https://github.com/newbee-ltd
 */
@Controller
@RequestMapping("/carousel")
@Api(tags ="轮播图管理 ")
public class CarouselController {

    @Autowired
    private CarouselService service;

    @GetMapping({"/index",""})
    public String index(HttpServletRequest request){
        return "admin/carousel";
    }

    @GetMapping("/find")
    @ResponseBody
    public Result find(Carousel carousel){
        return service.find(carousel);
    }


    @PostMapping("/add")
    @ResponseBody
    public Result add(@RequestBody Carousel carousel){
        carousel.setCreateTime(new Date());
        carousel.setCreateUser(SystemUtil.getSysUser().getId());
        return service.add(carousel);
    }

    @PostMapping("/update")
    @ResponseBody
    public Result update(@RequestBody Carousel carousel){
        carousel.setUpdateTime(new Date());
        carousel.setUpdateUser(SystemUtil.getSysUser().getId());
        return service.update(carousel);
    }

    @PostMapping("/delete")
    @ResponseBody
    public Result delete(@RequestBody Integer[] ids){
        return service.delete(ids);
    }

    @PostMapping("/statusEdit")
    @ResponseBody
    public Result statusEdit(@RequestBody Integer[] ids,@RequestParam("status") String status){
        return service.statusEdit(ids,status);
    }

}