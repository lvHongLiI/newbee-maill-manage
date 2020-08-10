package com.lvhongli.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvhongli.dao.PlatformUserMapper;
import com.lvhongli.entity.PlatformUser;
import com.lvhongli.pojo.Page;
import com.lvhongli.pojo.PlatformUserVo;
import com.lvhongli.service.PlatformUserService;
import com.lvhongli.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PlatformUserServiceImpl implements PlatformUserService {

    @Autowired
    private PlatformUserMapper mapper;
    @Override
    public Result findAll(Page page) {
       PageHelper.startPage(page.getOffset(),page.getLimit());
        List<PlatformUserVo> list = mapper.findAll();
        return new Result(200,"查询成功!",new PageInfo<>(list));
    }

    @Override
    public Result statusEdit(Integer id, Byte status) {
        PlatformUser user = mapper.selectByPrimaryKey(id);
        if (user!=null){
            user.setStatus(status);
           if (mapper.updateByPrimaryKeySelective(user)==1)
               return new Result(200,"修改成功!");
        }
        return new Result(500,"修改失败!");
    }
}
