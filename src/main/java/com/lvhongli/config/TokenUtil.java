package com.lvhongli.config;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.security.Key;
import java.util.Date;

/**   
 * @Title: TokenUtil.java 
 * @Package com.amt.util 
 * @Description: TODO(token工具类) 
 * @author 江伟  
 * @date 2019年4月28日 下午2:32:26 
 * Copyright (c) ©1994-2019 Scjydz.com All Rights Reserved.
 */
@Slf4j
@Component
public class TokenUtil {

	@Autowired
	private Secret secret;
	
	/**
	 * @description: 获取不同时效的token 
	 * @param type 类型 1：时效4小时   2：时效5分钟
	 * @param userId 用户编号
	 * @return token
	 */
	public String getToken(int type, Integer userId) {
		try {
			SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
			long nowMillis = System.currentTimeMillis();
			Date now = new Date(nowMillis);
			// 我们将用Secret的秘密签署我们的JWT
			byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(secret.getKey()+"qjyx");
			Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());
			// 设置JWT声明  
			JwtBuilder builder = Jwts.builder().setId(userId.toString()).setIssuedAt(now).setSubject(secret.getSubject())
					.setIssuer(secret.getIssuer()).signWith(signatureAlgorithm,signingKey);
			// 设置过期时间 
			long expMillis = 0;
			switch (type) {
			case 1:
				expMillis = nowMillis + secret.getBttlMillis();
				break;
			case 2:
				expMillis = nowMillis + secret.getTtlMillis();
				break;
			default:
				expMillis = nowMillis + secret.getBttlMillis();
				break;
			}
			
			Date exp = new Date(expMillis);
			builder.setExpiration(exp);
			// 构建JWT并将其序列化为一个紧凑、安全的url字符串
			return builder.compact();
		} catch (Exception e) {
			log.error("生成权限码异常:", e);
			return null;
		}
	}
	
}
