/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.service;


import com.lvhongli.pojo.GoodsOrderItemParam;
import com.lvhongli.pojo.GoodsOrderParam;
import com.lvhongli.util.Result;

public interface GoodsOrderService {

    /**
     * 查询订单
     * @param orderParam
     * @return
     */
    Result find(GoodsOrderParam orderParam);

    /**
     * 查询订单详情
     * @param param
     * @return
     */
    Result selectOrderItem(GoodsOrderItemParam param);

    /**
     * 修改配送状态
     * @param ids
     * @param status
     * @return
     */
    Result deliveryStatusEdit(String[] ids, Byte status);

//    /**
//     * 后台分页
//     *
//     * @param pageUtil
//     * @return
//     */
//    PageResult getNewBeeMallOrdersPage(PageQueryUtil pageUtil);
//
//    /**
//     * 订单信息修改
//     *
//     * @param newBeeMallOrder
//     * @return
//     */
//    String updateOrderInfo(NewBeeMallOrder newBeeMallOrder);
//
//    /**
//     * 配货
//     *
//     * @param ids
//     * @return
//     */
//    String checkDone(Long[] ids);
//
//    /**
//     * 出库
//     *
//     * @param ids
//     * @return
//     */
//    String checkOut(Long[] ids);
//
//    /**
//     * 关闭订单
//     *
//     * @param ids
//     * @return
//     */
//    String closeOrder(Long[] ids);
//
//    List<NewBeeMallOrderItem> getOrderItems(Long id);
}
