package com.lvhongli.dao;

import com.lvhongli.entity.PlatformUser;
import com.lvhongli.pojo.PlatformUserVo;

import java.util.List;

public interface PlatformUserMapper extends MyBaseMapper<PlatformUser> {



    List<PlatformUserVo> findAll();


    String findNameById(Integer id);
}
