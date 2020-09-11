package com.lvhongli.config;

import com.lvhongli.dao.SysUserMapper;
import com.lvhongli.entity.SysUser;
import com.lvhongli.util.SystemUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// 认证成功
@Component
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler {


	@Autowired
	private SysUserMapper mapper;

	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication arg2)
			throws IOException, ServletException {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		SysUser user = mapper.findByName(account);
		SystemUtil.getSession().setAttribute("user",user);
		res.sendRedirect("/index.html");
	}

}
