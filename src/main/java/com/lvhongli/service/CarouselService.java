/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.service;


import com.lvhongli.entity.Carousel;
import com.lvhongli.util.Result;

public interface CarouselService {

    /**
     * 查询方法
     * @param carousel
     * @return
     */
    Result find(Carousel carousel);

    /**
     * 添加方法
     * @param carousel
     * @return
     */
    Result add(Carousel carousel);

    /**
     * 修改方法
     * @param carousel
     * @return
     */
    Result update(Carousel carousel);

    /**
     * 删除方法
     * @param ids
     * @return
     */
    Result delete(Integer[] ids);

    /**
     * 修改状态方法
     * @param ids
     * @param status
     * @return
     */
    Result statusEdit(Integer[] ids, String status);
}
