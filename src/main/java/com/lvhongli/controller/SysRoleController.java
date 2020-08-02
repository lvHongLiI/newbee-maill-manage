package com.lvhongli.controller;
import com.lvhongli.entity.SysRole;
import com.lvhongli.pojo.RoleParam;
import com.lvhongli.service.SysRoleService;
import com.lvhongli.util.Result;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("role")
@Controller
@Api(tags = "系统角色管理")
public class SysRoleController {

    @Autowired
    private SysRoleService service;

    @GetMapping({"/index",""})
    public String index(String name){
        return "admin/sys_role";
    }

    @GetMapping("/findAll")
    @ResponseBody
    public Result findAll(RoleParam role){
        return service.findAll(role);
    }

    @PostMapping("/add")
    @ResponseBody
    public Result add(@RequestBody SysRole role){
        return service.add(role);

    }

    @PostMapping("/delete")
    @ResponseBody
    public Result delete(@RequestBody Integer[] ids){
        return service.delete(ids);
    }

    @PostMapping("/update")
    @ResponseBody
    public Result update(@RequestBody SysRole role){
        return service.update(role);
    }


    @PostMapping("/addMenu")
    @ResponseBody
    public Result addMenu( Integer roleId, Integer[] menusIds){
        return service.addMenu(roleId,menusIds);
    }

    @GetMapping("/findById")
    public String findById(Integer id,HttpServletRequest request){
        SysRole role = service.findById(id);
        request.setAttribute("role",role);
        return "admin/sys_role_details";
    }

}
