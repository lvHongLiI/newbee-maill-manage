package com.lvhongli.config;

import com.google.common.base.Function;
import com.google.common.base.Optional;
import com.google.common.base.Predicate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.RequestHandler;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

/**
 * @Title: Swagger2.java 
 * @Package com.amt.configure 
 * @Description: TODO(Swagger2插件配置类) 
 * @author 江伟  
 * @date 2018年11月1日 下午4:38:14 
 * Copyright (c) ©1994-2018 Scjydz.com All Rights Reserved.
 */
@Configuration
@EnableSwagger2
public class Swagger2 {
	
	// 定义分隔符,配置Swagger多包
    private static final String splitor = ";";
	
	/**
	 * @description: 文档@ApiOperation注解来给API增加说明、 通过@ApiImplicitParams、@ApiImplicitParam注解来给参数增加说明。
	 */
	@Bean
	public Docket createRestApi() {
		return new Docket(DocumentationType.SWAGGER_2)
				.apiInfo(apiInfo()).select()
				.apis(basePackage("com.lvhongli.controller"+splitor+"com.lvhongli.util"))
				.paths(PathSelectors.any()).build()
				.globalOperationParameters(this.setHeaderToken());
				
	}

	/**
	 * @description: 版本信息备注
	 */
	@SuppressWarnings("deprecation")
	private ApiInfo apiInfo() {
		return new ApiInfoBuilder()
				.title("Basic API")
				.description("基础微服务接口文档")
				.termsOfServiceUrl("http://scqjyx.cn/")
				.contact("lvhongli@qjyx.info")
				.version("1.0").build();
	}

	/**
	 * @description: 设置自定义参数
	 */
	private List<Parameter> setHeaderToken() {
		ParameterBuilder tokenPar = new ParameterBuilder();
		List<Parameter> pars = new ArrayList<>();
		tokenPar.name("accessToken")
				.description("认证令牌")
				.modelRef(new ModelRef("string"))
				.parameterType("header")
				.required(false)
				.build();
		pars.add(tokenPar.build());
		return pars;
	}
	
	/**
	 * @description: 重新组装包路径
	 * @param basePackage 包路径
	 */
	public static Predicate<RequestHandler> basePackage(final String basePackage) {
        return input -> declaringClass(input).transform(handlerPackage(basePackage)).or(true);
    }

	/**
	 * @description: 处理包路径配置规则,支持多路径扫描匹配以自定义符号隔开
	 * @param basePackage 包路径
	 */
    private static Function<Class<?>, Boolean> handlerPackage(final String basePackage)     {
        return input -> {
            // 循环判断匹配
            for (String strPackage : basePackage.split(splitor)) {
                boolean isMatch = input.getPackage().getName().startsWith(strPackage);
                if (isMatch) {
                    return true;
                }
            }
            return false;
        };
    }

    /**
     * @description:  声明类方法
     * @param input 
     */
    @SuppressWarnings("deprecation")
	private static Optional<? extends Class<?>> declaringClass(RequestHandler input) {
        return Optional.fromNullable(input.declaringClass());
    }
	
}
