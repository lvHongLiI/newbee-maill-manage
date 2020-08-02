package com.lvhongli.config;
import java.util.Map;

import javax.servlet.MultipartConfigElement;

import com.lvhongli.util.DateUtil;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.unit.DataSize;

/**
 * @Title: Upload.java
 * @Package com.amt.configure
 * @Description: TODO(文件上传配置类)
 * @author 吕宏力
 * @date 2019年3月21日 下午3:51:35
 * Copyright (c) ©1994-2019 Scjydz.com All Rights Reserved.
 */
@Component
@ConfigurationProperties("upload")
@Slf4j
@Data
public class Upload {

    // 获取存放位置
    private Map<String, String> localtion;

    // 单个文件大小
    private long maxFileSize;

    // 上次总文件大小
    private long maxRequestSize;

    //文件访问前缀/域名
    private String fileAccessPrefix;

    /**
     * @description: 获取文件存放路径
     * @return 文件存放路径
     */
    public String getBasePath() {
        return getSystemPath("");
    }

    /**
     * @description: 获取存放轮播图存放路径
     * @return 轮播图存放路径
     */
    public String getCarouselPath() {
        return getSystemPath(getType("carousel"));
    }

    /**
     * @description: 获取商品图片存放路径
     * @return 商品存放路径
     */
    public String getGoodsPath() {
        return getSystemPath(getType("goods"));
    }

    /**
     * @description: 获取有层级的系统路径
     * @param tmp 层级路径
     * @return 系统路径
     */
    public String getSystemPath(String tmp) {
        String location = null;
        String os = System.getProperty("os.name");
        if(os.toLowerCase().startsWith("win")) {
            location = this.getLocaltion().get("windows")+tmp;
        } else {
            location = this.getLocaltion().get("linux")+tmp;
        }
        return location;
    }








    /**
     * @Title: multipartConfigElement
     * @Description: TODO(初始化文件上传)
     * @return MultipartConfigElement    返回类型
     */
    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        // 设置文件大小限制 ,超出设置页面会抛出异常信息，
        // 这样在文件上传的地方就需要进行异常信息的处理了;
        factory.setMaxFileSize(DataSize.ofBytes(this.getMaxFileSize())); // KB,MB
        /// 设置总上传数据总大小
        factory.setMaxRequestSize(DataSize.ofBytes(this.getMaxRequestSize()));
        // 设置文件临时路径
        factory.setLocation(this.getBasePath());
        log.info("Initialization upload parameter is successful. (初始化文件上传参数成功。)");
        return factory.createMultipartConfig();
    }


    public String getType(String type) {
        switch (type){
            case "goods":
                return   "goods/"+ DateUtil.getDay()+"/";
            case "carousel":
                return   "carousel/"+ DateUtil.getDay()+"/";
            default:
                return "";
        }
    }
}

