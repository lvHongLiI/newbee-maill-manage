package com.lvhongli.config;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.alibaba.druid.wall.WallConfig;
import com.alibaba.druid.wall.WallFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;

import javax.sql.DataSource;

/**
 * @Title: DruidConfig.java 
 * @Package com.amt.configure 
 * @Description: TODO(druid配置类，druid的注册 。包含多个数据源的注册；分布式事务管理器的注册；) 
 * @author 江伟  
 * @date 2019年7月2日 下午5:19:39 
 * Copyright (c) ©1994-2019 Scjydz.com All Rights Reserved.
 */
@Configuration
public class DruidConfig {
	
//	/**
//	 * @description: 注入事物管理器
//	 * @return
//	 */
//    @Bean(name = "xatx")
//    public JtaTransactionManager regTransactionManager () {
//        UserTransactionManager userTransactionManager = new UserTransactionManager();
//        UserTransaction userTransaction = new UserTransactionImp();
//        JtaTransactionManager jta = new JtaTransactionManager(userTransaction, userTransactionManager);
//        return jta;
//    }
	
	/**
	 * @description: 定义数据源writeDataSource
	 * @param env
	 * @return
	 */
	@Bean(name = "writeDataSource",destroyMethod = "close",initMethod = "init")
	@ConfigurationProperties(prefix = "spring.datasource")
    @Primary
    @Autowired
	public DataSource writeDataSource(Environment env) {
//		AtomikosDataSourceBean ds = new AtomikosDataSourceBean();
//        ds.setXaDataSourceClassName("com.alibaba.druid.pool.xa.DruidXADataSource");
//        ds.setUniqueResourceName("writeDB");
//        ds.setPoolSize(5);
//		Properties prop = build(env, "spring.datasource.druid.writeDB.");
//        ds.setXaProperties(prop);
        return new DruidDataSource();
	}
	
	/**
	 * @description: 定义数据源queryDataSource
	 * @param env
	 * @return
	 *//*
	@Autowired
    @Bean(name = "queryDataSource")
    public AtomikosDataSourceBean queryDataSource(Environment env) {
        AtomikosDataSourceBean ds = new AtomikosDataSourceBean();
        Properties prop = build(env, "spring.datasource.druid.queryDB.");
        ds.setXaDataSourceClassName("com.alibaba.druid.pool.xa.DruidXADataSource");
        ds.setUniqueResourceName("queryDB");
        ds.setPoolSize(5);
        ds.setXaProperties(prop);
        return ds;
    }*/


	
 
    /**
     * @description: 参数赋值
     * @param env
     * @param prefix
     * @return
     */
    /*private Properties build(Environment env, String prefix) {
        Properties prop = new Properties();
        prop.put("url", env.getProperty(prefix + "url"));
        prop.put("username", env.getProperty(prefix + "username"));
        prop.put("password", env.getProperty(prefix + "password"));
        prop.put("driverClassName", env.getProperty(prefix + "driverClassName", ""));
        prop.put("initialSize", env.getProperty(prefix + "initialSize", Integer.class));
        prop.put("maxActive", env.getProperty(prefix + "maxActive", Integer.class));
        prop.put("minIdle", env.getProperty(prefix + "minIdle", Integer.class));
        prop.put("maxWait", env.getProperty(prefix + "maxWait", Integer.class));
        prop.put("poolPreparedStatements", env.getProperty(prefix + "poolPreparedStatements", Boolean.class));
        prop.put("maxPoolPreparedStatementPerConnectionSize",
                env.getProperty(prefix + "maxPoolPreparedStatementPerConnectionSize", Integer.class));
        prop.put("maxPoolPreparedStatementPerConnectionSize",
                env.getProperty(prefix + "maxPoolPreparedStatementPerConnectionSize", Integer.class));
        prop.put("validationQuery", env.getProperty(prefix + "validationQuery"));
        prop.put("validationQueryTimeout", env.getProperty(prefix + "validationQueryTimeout", Integer.class));
        prop.put("testOnBorrow", env.getProperty(prefix + "testOnBorrow", Boolean.class));
        prop.put("testOnReturn", env.getProperty(prefix + "testOnReturn", Boolean.class));
        prop.put("testWhileIdle", env.getProperty(prefix + "testWhileIdle", Boolean.class));
        prop.put("timeBetweenEvictionRunsMillis",
                env.getProperty(prefix + "timeBetweenEvictionRunsMillis", Integer.class));
        prop.put("minEvictableIdleTimeMillis", env.getProperty(prefix + "minEvictableIdleTimeMillis", Integer.class));
        prop.put("filters", env.getProperty(prefix + "filters"));
        return prop;
    }*/
 
    /**
     * @description: druid控制台权限配置
     * @return
     */
    @Bean
    public ServletRegistrationBean<StatViewServlet> druidServlet() {
        ServletRegistrationBean<StatViewServlet> servletRegistrationBean = new ServletRegistrationBean<StatViewServlet>(new StatViewServlet(), "/druid/*");
        //控制台管理用户，加入下面2行 进入druid后台就需要登录
        servletRegistrationBean.addInitParameter("loginUsername", "yjyadmin");
        servletRegistrationBean.addInitParameter("loginPassword", "qjyxyjy1");
        return servletRegistrationBean;
    }
 
    /**
     * @description: 注册过滤器bean
     * @return
     */
    @Bean
    public FilterRegistrationBean<WebStatFilter> filterRegistrationBean() {
        FilterRegistrationBean<WebStatFilter> filterRegistrationBean = new FilterRegistrationBean<WebStatFilter>();
        filterRegistrationBean.setFilter(new WebStatFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        filterRegistrationBean.addInitParameter("profileEnable", "true");
        return filterRegistrationBean;
    }
 
    /**
     * @description: 注入druid查询过滤器
     * @return
     */
    @Bean
    public StatFilter statFilter(){
        StatFilter statFilter = new StatFilter();
        statFilter.setLogSlowSql(true); //slowSqlMillis用来配置SQL慢的标准，执行时间超过slowSqlMillis的就是慢。
        statFilter.setMergeSql(true); //SQL合并配置
        statFilter.setSlowSqlMillis(6000);//slowSqlMillis的缺省值为3000，也就是3秒。
        return statFilter;
    }
 
    /**
     * @description: 注入druid多sql查询过滤器
     * @return
     */
    @Bean
    public WallFilter wallFilter(){
        WallFilter wallFilter = new WallFilter();
        //允许执行多条SQL
        WallConfig config = new WallConfig();
        config.setMultiStatementAllow(true);
        wallFilter.setConfig(config);
        return wallFilter;
    }

}
