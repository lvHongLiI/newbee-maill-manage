/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2020 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.lvhongli.controller.common;

import com.lvhongli.config.Upload;

import com.lvhongli.util.Result;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author 13
 * @qq交流群 796794009
 * @email 2449207463@qq.com
 * @link https://github.com/newbee-ltd
 */
@Controller
@Slf4j
public class UploadController {

    @Autowired
    private Upload upload;

    // 文件格式白名单
    private String whiteFileType = ".+(doc|docx|xls|xlsx|zip|rar|jpg|png|jpeg|gif|JPEG|JPG|PNG)$";



    @ApiOperation(value = "单个文件上传")
    @RequestMapping(value = "/upload/file", method = RequestMethod.POST)
    @ResponseBody
    public Result uploadFile(@RequestParam("file") MultipartFile  file, HttpServletRequest request,String type) {
        Result result=null;
        // 获取文件存放根路径
        String basePath = upload.getBasePath();
        // 文件存放分支路径
        String location = upload.getType(type);
        // 文件类型
        String contentType = null;
        // 原文件名称
        String fileName = null;
        // 存放名称
        String saveName = null;
        // 图片后缀
        String imgSuffix = null;
        // 判断文件夹是否存在，不存在则
        File targetFile = new File(basePath + location);
        if(!targetFile.exists()){
            targetFile.setWritable(true, false);
            targetFile.mkdirs();
        }

        fileName = file.getOriginalFilename();
        imgSuffix = fileName.substring(fileName.lastIndexOf("."));
        Matcher matcher = Pattern.compile(whiteFileType).matcher(imgSuffix);
        if(matcher.find()) { // 验证文件格式
            contentType = file.getContentType();
            saveName = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase() + imgSuffix;
            try {
                // java7中新增特性
                // ATOMIC_MOVE 原子性的复制
                // COPY_ATTRIBUTES 将源文件的文件属性信息复制到目标文件中
                // REPLACE_EXISTING 替换已存在的文件
                Files.copy(file.getInputStream(), Paths.get(upload.getBasePath() + location, saveName),
                        StandardCopyOption.REPLACE_EXISTING);
                result =new Result(200,"",upload.getFileAccessPrefix() + location + saveName);
            } catch (Exception e) {
                result=new Result(500,e.getMessage());
                log.error("上传文件失败，{}" , e);
            }

        } else {
            log.error("非法的文件格式，{}",imgSuffix);
            result=new Result(500,"非法的文件格式");
        }
        return result;
    }
}
