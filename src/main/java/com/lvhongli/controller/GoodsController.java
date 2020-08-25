package com.lvhongli.controller;

import com.lvhongli.pojo.GoodsCategoryVo;
import com.lvhongli.pojo.GoodsParam;
import com.lvhongli.service.GoodsCategoryService;
import com.lvhongli.service.GoodsService;
import com.lvhongli.util.Result;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService service;

    @Autowired
    private GoodsCategoryService categoryService;

    @GetMapping({"","/","index"})
    @ResponseBody
    public String index(HttpServletRequest request){
        List<GoodsCategoryVo> list=categoryService.selectByPid(0);
        request.setAttribute("categorys",list);
        return "admin/goods";
    }

    @GetMapping("/find")
    @ResponseBody
    public Result find(GoodsParam param){
        return service.find(param);
    }
}
