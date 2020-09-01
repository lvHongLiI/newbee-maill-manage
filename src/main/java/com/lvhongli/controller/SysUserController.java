/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.controller;

import com.lvhongli.config.TokenUtil;
import com.lvhongli.entity.SysUser;
import com.lvhongli.common.ServiceResultEnum;

import com.lvhongli.pojo.Page;
import com.lvhongli.service.SysUserService;
import com.lvhongli.util.Result;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @author 13
 * @qq交流群 796794009
 * @email 2449207463@qq.com
 * @link https://github.com/newbee-ltd
 */
@Controller
@RequestMapping("/user")
@Api(tags ="系统用户管理")
public class SysUserController {

    @Autowired
    private TokenUtil tokenUtil;

    @Resource
    private SysUserService service;

    @PostMapping("/add")
    @ResponseBody
    public Result add(@RequestBody SysUser user,HttpServletRequest request){
        SysUser sys = (SysUser) request.getSession().getAttribute("user");
        user.setCreateUser(sys.getId());
        user.setCreateTime(new Date());
        return service.add(user);
    }

    @PostMapping("/delete")
    @ResponseBody
    public Result delete(@RequestBody Integer[] ids){
        return service.delete(ids);
    }

    @ResponseBody
    @GetMapping("/find")
    public Result find(Page page){
        return service.find(page);
    }

    @GetMapping("/findById")
    public String findById(Integer id,HttpServletRequest request){
        SysUser user=service.findById(id);
        request.setAttribute("user",user);
        return "admin/sys_user_details";
    }

    @ResponseBody
    @PostMapping("/addRole")
    public Result addRole(Integer userId,Integer[] roleIds){
        return service.addRoles(userId,roleIds);
    }


    @GetMapping({"", "/", "/index", "/index.html"})
    public String index(HttpServletRequest request) {
        request.setAttribute("path", "index");
        return "admin/sys_user";
    }


    @GetMapping("/profile")
    public String profile(HttpServletRequest request) {
        SysUser user = (SysUser) request.getSession().getAttribute("user");
        SysUser adminUser = service.getUserDetailById(user.getId());
        if (adminUser == null) {
            return "admin/login";
        }
        request.setAttribute("path", "profile");
        request.setAttribute("account", adminUser.getAccount());
        request.setAttribute("name", adminUser.getName());
        return "admin/profile";
    }

    @PostMapping("/profile/password")
    @ResponseBody
    public String passwordUpdate(HttpServletRequest request, @RequestParam("originalPassword") String originalPassword,
                                 @RequestParam("newPassword") String newPassword) {
        if (StringUtils.isEmpty(originalPassword) || StringUtils.isEmpty(newPassword)) {
            return "参数不能为空";
        }
        SysUser user = (SysUser) request.getSession().getAttribute("user");
        if (service.updatePassword(user.getId(), originalPassword, newPassword).getResultCode()==200) {
            //修改成功后清空session中的数据，前端控制跳转至登录页
            request.getSession().removeAttribute("user");
            request.getSession().removeAttribute("menus");
            request.getSession().removeAttribute("errorMsg");
            return ServiceResultEnum.SUCCESS.getResult();
        } else {
            return "修改失败";
        }
    }

    @PostMapping("/profile/name")
    @ResponseBody
    public String nameUpdate(HttpServletRequest request, @RequestParam("account") String account,
                             @RequestParam("name") String name) {
        if (StringUtils.isEmpty(account) || StringUtils.isEmpty(name)) {
            return "参数不能为空";
        }
        SysUser user = (SysUser) request.getSession().getAttribute("user");
        if (service.updateName(user.getId(), account, name)) {
            return ServiceResultEnum.SUCCESS.getResult();
        } else {
            return "修改失败";
        }
    }

//    @GetMapping("/logout")
//    public String logout(HttpServletRequest request) {
//        request.getSession().removeAttribute("user");
//        request.getSession().removeAttribute("menus");
//        request.getSession().removeAttribute("errorMsg");
//        return "/login";
//    }
}
