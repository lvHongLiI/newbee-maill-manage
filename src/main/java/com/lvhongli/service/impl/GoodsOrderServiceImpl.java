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
import com.lvhongli.dao.GoodsOrderItemMapper;
import com.lvhongli.dao.GoodsOrderMapper;
import com.lvhongli.entity.GoodsOrder;
import com.lvhongli.pojo.GoodsOrderItemParam;
import com.lvhongli.pojo.GoodsOrderItemVo;
import com.lvhongli.pojo.GoodsOrderParam;
import com.lvhongli.pojo.GoodsOrderVo;
import com.lvhongli.service.GoodsOrderService;
import com.lvhongli.util.Result;
import com.lvhongli.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsOrderServiceImpl implements GoodsOrderService {

    @Autowired
    private GoodsOrderMapper orderMapper;

    @Autowired
    private GoodsOrderItemMapper orderItemMapper;

    @Override
    public Result find(GoodsOrderParam orderParam) {
        PageHelper.startPage(orderParam.getOffset(),orderParam.getLimit());
        List<GoodsOrderVo> list=orderMapper.find(orderParam);
        return new Result(200,"查询成功！",new PageInfo<>(list));
    }


    @Override
    public Result selectOrderItem(GoodsOrderItemParam param) {
        PageHelper.startPage(param.getOffset(),param.getLimit());
        List<GoodsOrderItemVo> list = orderItemMapper.selectOrderItem(param.getOrderId());
        return new Result(200,"查询成功!",new PageInfo<>(list));
    }


    @Override
    public Result deliveryStatusEdit(String[] ids, Byte status) {
        if (StringUtil.isEmpty(ids))
            return new Result(201,"请选择一条记录");
        StringBuilder builder=new StringBuilder();
        for (String id : ids) {
            GoodsOrder goodsOrder = orderMapper.selectByPrimaryKey(id);
            if (goodsOrder==null){
                builder.append("订单号:").append(id).append("->").append("找不到该订单\n");
            }

            Byte deliveryStatus = goodsOrder.getDeliveryStatus();
            goodsOrder.setDeliveryStatus(status);
            if (goodsOrder.getStatus()!=null&&2==goodsOrder.getStatus()){
                //1.配送完成
                if (1==deliveryStatus&&2==status){
                    if (orderMapper.updateByPrimaryKeySelective(goodsOrder)==1)
                        continue;
                }else if (2==deliveryStatus&&3==status){
                    if (orderMapper.updateByPrimaryKeySelective(goodsOrder)==1)
                        continue;
                }
            }else {
                if (6==deliveryStatus&& 7==status){
                    if (orderMapper.updateByPrimaryKeySelective(goodsOrder)==1)
                        continue;
                }
            }
            builder.append("订单号:").append(id).append("->").append("传入状态不对！请核对后重试！\n");
        }
        return new Result(200,builder.toString());
    }


//    @Override
//    public PageResult getNewBeeMallOrdersPage(PageQueryUtil pageUtil) {
//        List<NewBeeMallOrder> newBeeMallOrders = newBeeMallOrderMapper.findNewBeeMallOrderList(pageUtil);
//        int total = newBeeMallOrderMapper.getTotalNewBeeMallOrders(pageUtil);
//        PageResult pageResult = new PageResult(newBeeMallOrders, total, pageUtil.getLimit(), pageUtil.getPage());
//        return pageResult;
//    }
//
//    @Override
//    @Transactional
//    public String updateOrderInfo(NewBeeMallOrder newBeeMallOrder) {
//        NewBeeMallOrder temp = newBeeMallOrderMapper.selectByPrimaryKey(newBeeMallOrder.getOrderId());
//        //不为空且orderStatus>=0且状态为出库之前可以修改部分信息
//        if (temp != null && temp.getOrderStatus() >= 0 && temp.getOrderStatus() < 3) {
//            temp.setTotalPrice(newBeeMallOrder.getTotalPrice());
//            temp.setUpdateTime(new Date());
//            if (newBeeMallOrderMapper.updateByPrimaryKeySelective(temp) > 0) {
//                return ServiceResultEnum.SUCCESS.getResult();
//            }
//            return ServiceResultEnum.DB_ERROR.getResult();
//        }
//        return ServiceResultEnum.DATA_NOT_EXIST.getResult();
//    }
//
//    @Override
//    @Transactional
//    public String checkDone(Long[] ids) {
//        //查询所有的订单 判断状态 修改状态和更新时间
//        List<NewBeeMallOrder> orders = newBeeMallOrderMapper.selectByPrimaryKeys(Arrays.asList(ids));
//        String errorOrderNos = "";
//        if (!CollectionUtils.isEmpty(orders)) {
//            for (NewBeeMallOrder newBeeMallOrder : orders) {
//                if (newBeeMallOrder.getIsDeleted() == 1) {
//                    errorOrderNos += newBeeMallOrder.getOrderNo() + " ";
//                    continue;
//                }
//                if (newBeeMallOrder.getOrderStatus() != 1) {
//                    errorOrderNos += newBeeMallOrder.getOrderNo() + " ";
//                }
//            }
//            if (StringUtils.isEmpty(errorOrderNos)) {
//                //订单状态正常 可以执行配货完成操作 修改订单状态和更新时间
//                if (newBeeMallOrderMapper.checkDone(Arrays.asList(ids)) > 0) {
//                    return ServiceResultEnum.SUCCESS.getResult();
//                } else {
//                    return ServiceResultEnum.DB_ERROR.getResult();
//                }
//            } else {
//                //订单此时不可执行出库操作
//                if (errorOrderNos.length() > 0 && errorOrderNos.length() < 100) {
//                    return errorOrderNos + "订单的状态不是支付成功无法执行出库操作";
//                } else {
//                    return "你选择了太多状态不是支付成功的订单，无法执行配货完成操作";
//                }
//            }
//        }
//        //未查询到数据 返回错误提示
//        return ServiceResultEnum.DATA_NOT_EXIST.getResult();
//    }
//
//    @Override
//    @Transactional
//    public String checkOut(Long[] ids) {
//        //查询所有的订单 判断状态 修改状态和更新时间
//        List<NewBeeMallOrder> orders = newBeeMallOrderMapper.selectByPrimaryKeys(Arrays.asList(ids));
//        String errorOrderNos = "";
//        if (!CollectionUtils.isEmpty(orders)) {
//            for (NewBeeMallOrder newBeeMallOrder : orders) {
//                if (newBeeMallOrder.getIsDeleted() == 1) {
//                    errorOrderNos += newBeeMallOrder.getOrderNo() + " ";
//                    continue;
//                }
//                if (newBeeMallOrder.getOrderStatus() != 1 && newBeeMallOrder.getOrderStatus() != 2) {
//                    errorOrderNos += newBeeMallOrder.getOrderNo() + " ";
//                }
//            }
//            if (StringUtils.isEmpty(errorOrderNos)) {
//                //订单状态正常 可以执行出库操作 修改订单状态和更新时间
//                if (newBeeMallOrderMapper.checkOut(Arrays.asList(ids)) > 0) {
//                    return ServiceResultEnum.SUCCESS.getResult();
//                } else {
//                    return ServiceResultEnum.DB_ERROR.getResult();
//                }
//            } else {
//                //订单此时不可执行出库操作
//                if (errorOrderNos.length() > 0 && errorOrderNos.length() < 100) {
//                    return errorOrderNos + "订单的状态不是支付成功或配货完成无法执行出库操作";
//                } else {
//                    return "你选择了太多状态不是支付成功或配货完成的订单，无法执行出库操作";
//                }
//            }
//        }
//        //未查询到数据 返回错误提示
//        return ServiceResultEnum.DATA_NOT_EXIST.getResult();
//    }
//
//    @Override
//    @Transactional
//    public String closeOrder(Long[] ids) {
//        //查询所有的订单 判断状态 修改状态和更新时间
//        List<NewBeeMallOrder> orders = newBeeMallOrderMapper.selectByPrimaryKeys(Arrays.asList(ids));
//        String errorOrderNos = "";
//        if (!CollectionUtils.isEmpty(orders)) {
//            for (NewBeeMallOrder newBeeMallOrder : orders) {
//                // isDeleted=1 一定为已关闭订单
//                if (newBeeMallOrder.getIsDeleted() == 1) {
//                    errorOrderNos += newBeeMallOrder.getOrderNo() + " ";
//                    continue;
//                }
//                //已关闭或者已完成无法关闭订单
//                if (newBeeMallOrder.getOrderStatus() == 4 || newBeeMallOrder.getOrderStatus() < 0) {
//                    errorOrderNos += newBeeMallOrder.getOrderNo() + " ";
//                }
//            }
//            if (StringUtils.isEmpty(errorOrderNos)) {
//                //订单状态正常 可以执行关闭操作 修改订单状态和更新时间
//                if (newBeeMallOrderMapper.closeOrder(Arrays.asList(ids), NewBeeMallOrderStatusEnum.ORDER_CLOSED_BY_JUDGE.getOrderStatus()) > 0) {
//                    return ServiceResultEnum.SUCCESS.getResult();
//                } else {
//                    return ServiceResultEnum.DB_ERROR.getResult();
//                }
//            } else {
//                //订单此时不可执行关闭操作
//                if (errorOrderNos.length() > 0 && errorOrderNos.length() < 100) {
//                    return errorOrderNos + "订单不能执行关闭操作";
//                } else {
//                    return "你选择的订单不能执行关闭操作";
//                }
//            }
//        }
//        //未查询到数据 返回错误提示
//        return ServiceResultEnum.DATA_NOT_EXIST.getResult();
//    }
//    @Override
//    public List<NewBeeMallOrderItem> getOrderItems(Long id) {
//        NewBeeMallOrder newBeeMallOrder = newBeeMallOrderMapper.selectByPrimaryKey(id);
//        if (newBeeMallOrder != null) {
//            List<NewBeeMallOrderItem> orderItems = newBeeMallOrderItemMapper.selectByOrderId(newBeeMallOrder.getOrderId());
//            //获取订单项数据
//            if (!CollectionUtils.isEmpty(orderItems)) {
//                return orderItems;
//            }
//        }
//        return null;
//    }
}
