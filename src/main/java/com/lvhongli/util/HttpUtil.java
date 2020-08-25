package com.lvhongli.util;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpClientParams;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.Set;

public class HttpUtil {

    public static String requestGet(String url, Map<String,String> map){
        HttpClient client = new HttpClient();
        // 设置连接超时时间
        client.getHttpConnectionManager().getParams().setConnectionTimeout(10000);
        GetMethod get = new GetMethod(url);
        try {
            get.setRequestHeader("Accept","application/json");
            client.executeMethod(get);
            //1.添加请求头信息
            Set<Map.Entry<String, String>> entries = map.entrySet();
            for (Map.Entry<String, String> entry : entries) {
                get.setRequestHeader(entry.getKey(),entry.getValue());
            }
            get.setParams(new HttpClientParams());
            InputStream ins = get.getResponseBodyAsStream();
            // 按指定的字符集构建文件流
            BufferedReader br = new BufferedReader(new InputStreamReader(ins, "utf-8"));
            StringBuffer sbf = new StringBuffer();
            String line = null;
            while ((line = br.readLine()) != null) {
                sbf.append(line);
            }

            br.close();
            return sbf.toString();
        } catch (HttpException e) {
        } catch (IOException e) {
        }
        get.releaseConnection();
        return null;
    }


    /**
     * @description: 无参数的post请求(HttpClient处理)
     * @param url 发送请求的URL
     */
    public static String requestPost(String url) {
        HttpClient client = new HttpClient();
        // 设置连接超时时间
        client.getHttpConnectionManager().getParams().setConnectionTimeout(120000);
        PostMethod post = new PostMethod(url);
        try {
            if (post != null) {
                client.executeMethod(post);
                InputStream ins = post.getResponseBodyAsStream();
                // 按指定的字符集构建文件流
                BufferedReader br = new BufferedReader(new InputStreamReader(ins, "utf-8"));
                StringBuffer sbf = new StringBuffer();
                String line = null;
                while ((line = br.readLine()) != null) {
                    sbf.append(line);
                }
                br.close();
                return sbf.toString();
            }
        } catch (HttpException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        post.releaseConnection();
        return null;
    }

}
