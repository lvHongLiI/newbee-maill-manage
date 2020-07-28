package com.lvhongli.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvhongli.dao.RoleMenuLinkMapper;
import com.lvhongli.dao.SysMenuMapper;
import com.lvhongli.dao.SysRoleMapper;
import com.lvhongli.entity.SysRole;
import com.lvhongli.pojo.RoleParam;
import com.lvhongli.pojo.RoleVo;
import com.lvhongli.service.SysRoleService;
import com.lvhongli.util.Result;
import com.lvhongli.util.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Transactional
public class SysRoleServiceImpl implements SysRoleService {

    @Autowired
    private SysRoleMapper mapper;
    @Autowired
    private RoleMenuLinkMapper roleMenuLinkMapper;
    @Autowired
    private SysMenuMapper sysMenuMapper;
    @Override
    public Result findAll(RoleParam role) {
        PageHelper.startPage(role.getOffset(),role.getLimit());
        List<SysRole> roles = mapper.findAll(role);
        List<RoleVo> roleVos=new ArrayList<>();
        if (StringUtil.isNotEmpty(roles)) {
                roleVos= roles.stream().map(s -> {
                RoleVo vo = new RoleVo();
                BeanUtils.copyProperties(s, vo);
                String haveMenu = sysMenuMapper.findName(s.getId()).toString().replaceAll("\\[|\\]", "");
                vo.setHaveMenu(haveMenu);
                return vo;
            }).collect(Collectors.toList());
        }
        return new Result(200,"查询成功!", new PageInfo<>(roleVos));
    }

    @Override
    public Result add(SysRole role) {
        if (mapper.insert(role)==1)
            return new Result(200,"添加成功!");
        return new Result(500,"添加失败");
    }

    @Override
    public Result delete(Integer[] ids) {
       if (ids==null||ids.length==0)
           return new Result(500,"参数不能为空");
       mapper.deleteAll(ids);
       roleMenuLinkMapper.deleteById("role_id",ids);
       return new Result(200,"删除成功!");
    }

    @Override
    public Result update(SysRole role) {
        if (role==null||mapper.selectByPrimaryKey(role.getId())==null)
            return new Result(500,"找不到对象");
        if (mapper.updateByPrimaryKey(role)==1)
            return new Result(200,"修改成功！");
        return new Result(500,"修改失败！");
    }

    @Override
    public Result addMenu(Integer roleId, Integer[] menusIds) {
        roleMenuLinkMapper.deleteById("role_id",new Integer[]{roleId});
        if (!StringUtil.isEmpty(menusIds))
            roleMenuLinkMapper.addAll(roleId,menusIds);
        return new Result(200,"添加菜单成功!");
    }

    @Override
    public Result findById(Integer id) {
        SysRole sysRole = mapper.findById(id);
        if (sysRole==null)
            return new Result(500,"根据id找不到对象");
        //拿到该角色下面所有的菜单
        List<Map> existMenus = sysMenuMapper.findByRoleIdExist(id);
        if (StringUtil.isNotEmpty(existMenus))
            sysRole.getMenus().addAll(existMenus);
        //判断该菜单是否存在
        return new Result(200,"查询成功！",sysRole);
    }
}
