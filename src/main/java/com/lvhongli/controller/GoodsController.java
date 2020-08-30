package com.lvhongli.controller;

import com.lvhongli.entity.Goods;
import com.lvhongli.pojo.GoodsCategoryVo;
import com.lvhongli.pojo.GoodsParam;
import com.lvhongli.service.GoodsCategoryService;
import com.lvhongli.service.GoodsService;
import com.lvhongli.util.Result;
import com.lvhongli.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService service;

    @Autowired
    private GoodsCategoryService categoryService;

    @GetMapping({"","/","index"})
    public String index(HttpServletRequest request){
        List<GoodsCategoryVo> list=categoryService.selectByPid(0);
        request.setAttribute("categorys",list);
        return "admin/goods";
    }

    @GetMapping("/goodsEdit")
    public String goodsEdit(HttpServletRequest request,String id){
        Goods goods=null;
        List<GoodsCategoryVo> oneCategorys=null;
        List<GoodsCategoryVo> twoCategorys=null;
        List<GoodsCategoryVo> threeCategorys=null;
        Integer oneId=null;
        Integer twoId=null;
        Integer threeId=null;
        if (id!=null){
            //1.查询修改商品的信息
            goods=service.findById(id);
            request.setAttribute("goods",goods);
            //2.查询分类信息
            if (goods!=null){
                threeId = goods.getCategoryId();
                twoId= categoryService.getPid(threeId);
                oneId=categoryService.getPid(twoId);
                threeCategorys=categoryService.selectByPid(twoId);
                twoCategorys=categoryService.selectByPid(oneId);
                request.setAttribute("twoCategorys",twoCategorys);
                request.setAttribute("threeCategorys",threeCategorys);
                request.setAttribute("oneId",oneId);
                request.setAttribute("twoId",twoId);
                request.setAttribute("threeId",threeId);
            }
        }
        oneCategorys=categoryService.selectByPid(0);
        request.setAttribute("oneCategorys",oneCategorys);
        return "admin/goods_edit";
    }

    @GetMapping("/findAll")
    @ResponseBody
    public Result findAll(GoodsParam param){
        return service.findAll(param);
    }


    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody Goods goods){
        if (StringUtil.isEmpty(goods.getId())){//添加
            goods.setCreateUser(0);
            return service.add(goods);
        }else {//修改
            goods.setUpdateUser(0);
            return service.update(goods);
        }
    }


    @PostMapping("/statusEdit")
    @ResponseBody
    public Result statusEdit(@RequestBody String[] ids,Byte status){
        return service.statusEdit(ids,status);
    }
}
