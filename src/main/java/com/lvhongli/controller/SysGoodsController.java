package com.lvhongli.controller;


import com.lvhongli.entity.SysUser;
import com.lvhongli.pojo.GoodsOrderParam;
import com.lvhongli.service.GoodsOrderService;
import com.lvhongli.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/sysGoodsOrder")
public class SysGoodsController {

    @Autowired
    private GoodsOrderService service;

    @GetMapping({"","/","/index"})
    public String index(HttpServletRequest request){
        return "admin/sysGoodsOrder";
    }

    /**
     * 查询方法
     * @param orderParam
     * @return
     */
    @GetMapping("/find")
    @ResponseBody
    public Result find(GoodsOrderParam orderParam, HttpServletRequest request){
        return service.find(orderParam);
    }

}
