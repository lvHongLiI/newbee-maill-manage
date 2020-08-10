package com.lvhongli.service;

import com.lvhongli.pojo.Page;
import com.lvhongli.util.Result;

public interface PlatformUserService {

    /**
     * 分页查询所有平台用户
     * @param page
     * @return
     */
    Result findAll(Page page);

    /**
     * 修改状态
     * @param id
     * @param status
     * @return
     */
    Result statusEdit(Integer id, Byte status);
}
