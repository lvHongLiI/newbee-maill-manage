package com.lvhongli.config;
import com.lvhongli.dao.SysMenuMapper;
import com.lvhongli.entity.SysMenu;
import com.lvhongli.service.SysUserService;
import com.lvhongli.util.MD5Util;
import com.lvhongli.util.StringUtil;
import com.lvhongli.util.SystemUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.List;
import java.util.stream.Collectors;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    MyAuthenticationSuccessHandler successHandler;
    @Autowired
    MyAuthenticationFailureHandler failureHandler;

    @Autowired
    SysUserService sysUserService;

    @Autowired
    SysMenuMapper sysMenuMapper;

    /*授权*/
    @Override
    protected  void configure(HttpSecurity http) throws Exception {
        List<SysMenu> list = sysMenuMapper.findAll()
                .stream().filter(s-> StringUtil.isNotEmpty(s.getAccessUrl())).collect(Collectors.toList());

        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry  configurer = http.authorizeRequests();
        for (SysMenu menu : list) {
            String accessUrl = menu.getAccessUrl();
            configurer.antMatchers(accessUrl.substring(0,accessUrl.lastIndexOf("/")+1)+"**").hasAnyAuthority(accessUrl);
        }
         configurer
         .antMatchers("/login").permitAll()
         .antMatchers("/**").fullyAuthenticated().and().formLogin()
         .loginPage("/login").loginProcessingUrl("/user/login").failureUrl("/logout")
         .successHandler(successHandler).failureHandler(failureHandler)
         .and().csrf().disable();

    }

    /*认证*/
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(sysUserService).passwordEncoder(new PasswordEncoder() {
            @Override
            public String encode(CharSequence charSequence) {
                return null;
            }

            @Override
            public boolean matches(CharSequence resPassword, String password) {
                String s = (String) SystemUtil.getSession().getAttribute("salt");
                System.out.println("slat值:"+s);
                System.out.println("密码比对:"+MD5Util.md5((String) resPassword,s).equals(password));
                return MD5Util.md5((String) resPassword,s).equals(password);
            }
        });
    }


    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/admin/**","/login");
    }


}
