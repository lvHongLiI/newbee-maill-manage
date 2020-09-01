package com.lvhongli.util;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Title: MD5Util.java 
 * @Package com.meatball.util
 * @Description: TODO(带盐加密MD5工具类) 
 * @author 江伟  
 * @date 2019年12月14日 下午4:26:44 
 * Copyright (c) ©1994-2018 Scjydz.com All Rights Reserved.
 */
public class MD5Util {
	// 加盐参数
    public final static String hashAlgorithmName = "MD5";

    // 循环次数
    public final static int hashIterations = 1024;

    /**
     * @Description: shiro密码加密工具类
     * @param credentials 密码
     * @param saltSource 密码盐
     * @return String    返回类型
     */
    public static String md5(String credentials, String saltSource) {
        ByteSource salt = new Md5Hash(saltSource);
        return new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations).toString();
    }
    
    /**
     * @Description: 获取一个随机字符串
     * @param length 字符串长度
     * @return String    返回类型
     */
    public static String getRandomString(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }
    
    /**
     * @description: 获取12位随机数字 
     * @return 随机数
     */
    public static String getRandomNumber() {
    	Integer orderId = UUID.randomUUID().toString().hashCode();
        orderId = orderId < 0 ? - orderId : orderId;  
        return 1+String.format("%011d", orderId); 
    }
	/*
	 * // 总的请求个数 public static final int requestTotal = 1000;
	 * 
	 * // 同一时刻最大的并发线程的个数 public static final int concurrentThreadNum = 500; public
	 * static void main(String[] args) throws InterruptedException { ExecutorService
	 * executorService = Executors.newCachedThreadPool(); CountDownLatch
	 * countDownLatch = new CountDownLatch(requestTotal); Semaphore semaphore = new
	 * Semaphore(concurrentThreadNum); for (int i = 0; i< requestTotal; i++) {
	 * executorService.execute(()->{ try { semaphore.acquire(); String result =
	 * MD5Util.getRandomNumber(); System.out.println(result); semaphore.release(); }
	 * catch (InterruptedException e) { log.error("exception", e); }
	 * countDownLatch.countDown(); }); } countDownLatch.await();
	 * executorService.shutdown(); log.info("请求完成");
	 * 
	 * 
	 * 
	 * }
	 */
		
	 
}
