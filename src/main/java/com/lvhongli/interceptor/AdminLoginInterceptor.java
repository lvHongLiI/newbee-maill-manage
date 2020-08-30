///**
// * 严肃声明：
// * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
// * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
// * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
// * Copyright (c) 2020 十三 all rights reserved.
// * 版权所有，侵权必究！
// */
//package com.lvhongli.interceptor;
//
//import com.lvhongli.entity.SysUser;
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.util.HashMap;
//
///**
// * 后台系统身份验证拦截器
// *
// * @author 13
// * @qq交流群 796794009
// * @email 2449207463@qq.com
// * @link https://github.com/newbee-ltd
// */
//@Component
//public class AdminLoginInterceptor implements HandlerInterceptor {
//    public  static HashMap<Integer,String> tokens=new HashMap<>();
//
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
//        boolean flag=false;
//        String requestServletPath = request.getServletPath();
//        Object user = request.getSession().getAttribute("user");
//        if (!requestServletPath.startsWith("/user/login") && null == user) {
//            request.getSession().setAttribute("errorMsg", "请登陆");
//            response.sendRedirect(request.getContextPath() + "/user/login");
//        } else {
//            String token = (String) request.getSession().getAttribute("token");
//            if (token.equals(tokens.get(((SysUser)user).getId()))){
//                request.getSession().removeAttribute("errorMsg");
//                flag=true;
//            }else {
//                request.getSession().setAttribute("errorMsg", "该账户在另一处登录");
//                response.sendRedirect(request.getContextPath() + "/user/login");
//            }
//        }
//        return flag;
//    }
//
//    @Override
//    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
//
//    }
//}
