/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.controller;


import com.lvhongli.entity.SysUser;
import com.lvhongli.pojo.GoodsOrderItemParam;
import com.lvhongli.pojo.GoodsOrderParam;
import com.lvhongli.service.GoodsOrderService;

import com.lvhongli.util.IDGeneratorUtil;
import com.lvhongli.util.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.UUID;


/**
 * @author 13
 * @qq交流群 796794009
 * @email 2449207463@qq.com
 * @link https://github.com/newbee-ltd
 */
@Controller
@RequestMapping("/goodsOrder")
public class GoodsOrderController {

    @Autowired
    private GoodsOrderService service;



    @GetMapping({"","/","/index"})
    public String index(HttpServletRequest request){
        return "admin/goodsOrder";
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


    /**
     * 查询订单详情数据
     * @param param
     * @return
     */
    @GetMapping("/selectOrderItem")
    @ResponseBody
    public Result selectOrderItem(GoodsOrderItemParam param){
        return service.selectOrderItem(param);
    }


    /**
     * 修改配送状态
     * @param ids
     * @param status
     * @return
     */
    @PostMapping("/deliveryStatusEdit")
    @ResponseBody
    public Result deliveryStatusEdit(@RequestBody  String[] ids,Byte status){
        return service.deliveryStatusEdit(ids,status);
    }


//    @Resource
//    private NewBeeMallOrderService newBeeMallOrderService;
//
//    @GetMapping("/orders")
//    public String ordersPage(HttpServletRequest request) {
//        request.setAttribute("path", "orders");
//        return "admin/newbee_mall_order";
//    }
//
//    /**
//     * 列表
//     */
//    @RequestMapping(value = "/orders/list", method = RequestMethod.GET)
//    @ResponseBody
//    public Result list(@RequestParam Map<String, Object> params) {
//        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
//            return ResultGenerator.genFailResult("参数异常！");
//        }
//        PageQueryUtil pageUtil = new PageQueryUtil(params);
//        return ResultGenerator.genSuccessResult(newBeeMallOrderService.getNewBeeMallOrdersPage(pageUtil));
//    }
//
//    /**
//     * 修改
//     */
//    @RequestMapping(value = "/orders/update", method = RequestMethod.POST)
//    @ResponseBody
//    public Result update(@RequestBody NewBeeMallOrder newBeeMallOrder) {
//        if (Objects.isNull(newBeeMallOrder.getTotalPrice())
//                || Objects.isNull(newBeeMallOrder.getOrderId())
//                || newBeeMallOrder.getOrderId() < 1
//                || newBeeMallOrder.getTotalPrice() < 1) {
//            return ResultGenerator.genFailResult("参数异常！");
//        }
//        String result = newBeeMallOrderService.updateOrderInfo(newBeeMallOrder);
//        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
//            return ResultGenerator.genSuccessResult();
//        } else {
//            return ResultGenerator.genFailResult(result);
//        }
//    }
//
//    /**
//     * 详情
//     */
//    @GetMapping("/order-items/{id}")
//    @ResponseBody
//    public Result info(@PathVariable("id") Long id) {
//        List<NewBeeMallOrderItem> orderItems = newBeeMallOrderService.getOrderItems(id);
//        if (!CollectionUtils.isEmpty(orderItems)) {
//            return ResultGenerator.genSuccessResult(orderItems);
//        }
//        return ResultGenerator.genFailResult(ServiceResultEnum.DATA_NOT_EXIST.getResult());
//    }
//
//    /**
//     * 配货
//     */
//    @RequestMapping(value = "/orders/checkDone", method = RequestMethod.POST)
//    @ResponseBody
//    public Result checkDone(@RequestBody Long[] ids) {
//        if (ids.length < 1) {
//            return ResultGenerator.genFailResult("参数异常！");
//        }
//        String result = newBeeMallOrderService.checkDone(ids);
//        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
//            return ResultGenerator.genSuccessResult();
//        } else {
//            return ResultGenerator.genFailResult(result);
//        }
//    }
//
//    /**
//     * 出库
//     */
//    @RequestMapping(value = "/orders/checkOut", method = RequestMethod.POST)
//    @ResponseBody
//    public Result checkOut(@RequestBody Long[] ids) {
//        if (ids.length < 1) {
//            return ResultGenerator.genFailResult("参数异常！");
//        }
//        String result = newBeeMallOrderService.checkOut(ids);
//        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
//            return ResultGenerator.genSuccessResult();
//        } else {
//            return ResultGenerator.genFailResult(result);
//        }
//    }
//
//    /**
//     * 关闭订单
//     */
//    @RequestMapping(value = "/orders/close", method = RequestMethod.POST)
//    @ResponseBody
//    public Result closeOrder(@RequestBody Long[] ids) {
//        if (ids.length < 1) {
//            return ResultGenerator.genFailResult("参数异常！");
//        }
//        String result = newBeeMallOrderService.closeOrder(ids);
//        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
//            return ResultGenerator.genSuccessResult();
//        } else {
//            return ResultGenerator.genFailResult(result);
//        }
//    }

    public static void main(String[] args) {
        System.out.println(new IDGeneratorUtil().nextId());
        System.out.println(UUID.randomUUID().toString());
    }
}