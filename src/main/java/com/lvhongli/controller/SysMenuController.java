package com.lvhongli.controller;

import com.lvhongli.entity.SysMenu;
import com.lvhongli.pojo.MenuParam;
import com.lvhongli.service.SysMenuService;
import com.lvhongli.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("menu")
public class SysMenuController {

    @Autowired
    private SysMenuService service;


    @RequestMapping({"/index",""})
    public String menu(){
        return "admin/newbee_mall_menu";
    }

    @PostMapping("/add")
    @ResponseBody
    public Result add(@RequestBody @Validated SysMenu menu){
         return service.add(menu);
    }

    @PostMapping("/delete/{id}")
    public Result delete(@PathVariable("id") Integer id){
        return service.delete(id);
    }

    @PostMapping("/update")
    public Result update(@RequestBody @Validated SysMenu menu){
        return service.update(menu);
    }

    @GetMapping("/find")
    @ResponseBody
    public Result find(MenuParam menuParam){
        return service.find(menuParam);
    }

    @PostMapping("/getOneLevelMenu")
    public Result getOneLevelMenu(){
        return service.getOneLevelMenu();
    }

    @PostMapping("/findById/{id}")
    public Result findById(@PathVariable("id") Integer id){
        return service.findById(id);
    }
}
