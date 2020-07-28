package com.lvhongli.util;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**   
 * @Title: StringUtil.java 
 * @Package com.amt.util 
 * @Description: TODO(字符串处理工具类) 
 * @author 吕宏力
 * @date 2020年4月15日 上午10:50:41
 * Copyright (c) ©1994-2019 Scjydz.com All Rights Reserved.
 */
public class StringUtil {
	
	/**
	 * @description: 半角转全角
	 * @param input 半角值
	 * @return 全角值
	 */
	public static String ToSBC(String input) {
		char c[] = input.toCharArray();
		for (int i = 0; i < c.length; i++) {
			if (c[i] == ' ') {
				c[i] = '\u3000';
			} else if (c[i] < '\177') {
				c[i] = (char) (c[i] + 65248);

			}
		}
		return new String(c);
	}

	/**
	 * @description: 全角转半角
	 * @param input 全角值
	 * @return 半角值
	 */
	public static String ToDBC(String input) {

		char c[] = input.toCharArray();
		for (int i = 0; i < c.length; i++) {
			if (c[i] == '\u3000') {
				c[i] = ' ';
			} else if (c[i] > '\uFF00' && c[i] < '\uFF5F') {
				c[i] = (char) (c[i] - 65248);

			}
		}
		String returnString = new String(c);

		return returnString;
	}
	
	/**
	 * @description: 字符串空判断
	 * @param str 字符串
	 * @return 空 返回true   不空返回false
	 */
	public static boolean isEmpty(String str) {
        if (str == null || str.length() == 0) {
            return true;
        }
        return false;
    }

	/**
	 * @description: 字符串非空判断
	 * @param str 字符串
	 * @return 不空 返回true   空返回false
	 */
    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }
    
    
    /**
	 * @description: 集合空判断
	 * @param list 集合
	 * @return 空 返回true   不空返回false
	 */
	public static boolean isEmpty(List<?> list) {
        if (null == list||list.size()==0) {
            return true;
        }
        return false;
    }

	public static boolean isEmpty(Object[] objects) {
		if (null == objects||objects.length==0) {
			return true;
		}
		return false;
	}


	/**
	 * @description: 集合非空判断
	 * @param list 集合
	 * @return 不空 返回true   空返回false
	 */
    public static boolean isNotEmpty(List<?> list) {
		return !isEmpty(list);
    }
    
    /**
     * 
     * @description: 手机号排空+正则验证
     * @param str    手机号码
     * @return       true正确false错误
     */
    public static boolean isMobile(String str) {
        Pattern p = null;
        Matcher m = null;
        boolean b = false;
        String s2="^[1](([3|5|8][\\d])|([4][4,5,6,7,8,9])|([6][2,5,6,7])|([7][^9])|([9][1,8,9]))[\\d]{8}$";// 验证手机号
        if(StringUtil.isNotEmpty(str)){
            p = Pattern.compile(s2);
            m = p.matcher(str);
            b = m.matches();
        }
        return b;
    }
    
}
