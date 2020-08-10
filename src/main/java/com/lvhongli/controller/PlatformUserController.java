package com.lvhongli.controller;


import com.lvhongli.pojo.Page;
import com.lvhongli.service.PlatformUserService;
import com.lvhongli.util.Result;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("platformUser")
@Controller
@Api(tags = "平台角色管理")
public class PlatformUserController {

    @Autowired
    private PlatformUserService service;


    @GetMapping({"","/","/index"})
    public String index(){
        return "admin/platform_user";
    }

    @GetMapping("/findAll")
    @ResponseBody
    public Result findAll(Page page){
        return service.findAll(page);
    }

    @PostMapping("/statusEdit")
    @ResponseBody
    public Result statusEdit(@RequestParam("id") Integer id,@RequestParam Byte status){
        return  service.statusEdit(id,status);
    }
}
