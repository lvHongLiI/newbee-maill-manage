package com.lvhongli.controller;

import com.lvhongli.entity.SysMenu;
import com.lvhongli.pojo.MenuParam;
import com.lvhongli.service.SysMenuService;
import com.lvhongli.util.Result;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

@Controller
@RequestMapping("menu")
@Api(tags ="系统菜单管理")
public class SysMenuController {

    @Autowired
    private SysMenuService service;


    @GetMapping({"/index",""})
    public String menu(HttpServletRequest request,Integer pid, Integer level,Integer backPid){
        if (pid==null)
            pid=0;
        if (level==null)
            level=1;
        if (backPid==null)
            backPid=0;
        request.setAttribute("pid",pid);
        request.setAttribute("level",level);
        request.setAttribute("backPid",backPid);
        return "admin/sys_menu";
    }

    @PostMapping("/add")
    @ResponseBody
    public Result add(@RequestBody  SysMenu menu){

         return service.add(menu);
    }

    @PostMapping("/delete")
    @ResponseBody
    public Result delete( @RequestBody Integer[] ids){
        System.out.println("数组："+Arrays.toString(ids));
        return service.delete(ids);
    }

    @PostMapping("/update")
    @ResponseBody
    public Result update(@RequestBody @Validated SysMenu menu){
        return service.update(menu);
    }

//    @GetMapping("/find")
//    @ResponseBody
//    public Result find(){
//        return service.find(menuParam);
//    }

    @GetMapping("/getLevelMenu")
    @ResponseBody
    public Result getLevelMenu(MenuParam menuParam){
        return service.getLevelMenu(menuParam);
    }


    @PostMapping("/findById/{id}")
    public Result findById(@PathVariable("id") Integer id){
        return service.findById(id);
    }
}
