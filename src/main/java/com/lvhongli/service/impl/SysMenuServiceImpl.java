package com.lvhongli.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvhongli.dao.SysMenuMapper;
import com.lvhongli.entity.SysMenu;
import com.lvhongli.pojo.MenuParam;
import com.lvhongli.pojo.Page;
import com.lvhongli.service.SysMenuService;
import com.lvhongli.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class SysMenuServiceImpl implements SysMenuService {

    @Autowired
    private SysMenuMapper mapper;

    @Override
    public Result add(SysMenu menu) {
        if (mapper.insert(menu)==1)
            return new Result(200,"添加成功！");
        else
            return new Result(200,"添加失败");
    }

    @Override
    public Result delete(Integer[] ids) {
        mapper.deleteByIdOrPId(ids);
        return new Result(200,"删除成功！");
    }

    @Override
    public Result update(SysMenu menu) {
        if (mapper.selectByPrimaryKey(menu.getId())==null){
            return new Result(500,"找不到待修改的对象");
        }
        int row = mapper.updateByPrimaryKey(menu);
        return new Result(row==1?200:500,row==1?"修改成功!":"修改失败");
    }

    @Override
    public Result find(MenuParam menuParam) {
        PageHelper.startPage(menuParam.getOffset(),menuParam.getLimit());
        List<SysMenu> list=mapper.find(menuParam);
        PageInfo info = new PageInfo(list);
        return new Result(200,"查询成功！",info);
    }

    @Override
    public Result getLevelMenu(MenuParam menuParam) {
        PageHelper.startPage(menuParam.getOffset(),menuParam.getLimit());
        List<SysMenu> oneLevelMenu = mapper.getLevelMenu(menuParam.getPid());
        return new Result(200,"查询成功！",new PageInfo<>(oneLevelMenu));
    }

    @Override
    public Result findById(Integer id) {
        return new Result(200,"查询成功！",mapper.selectByPrimaryKey(id));
    }
}
