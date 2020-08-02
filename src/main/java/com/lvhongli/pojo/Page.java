package com.lvhongli.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Transient;

/**
 * @Title: Page.java 
 * @Package com.amt.configure 
 * @Description: TODO(分页参数配置) 
 * @author 江伟  
 * @date 2018年11月1日 下午4:11:33 
 * Copyright (c) ©1994-2018 Scjydz.com All Rights Reserved.
 */
@Data
public class Page {

	// 当前页
	@ApiModelProperty(value = "页码" ,example = "1")
	@Transient
	private Integer offset;
	
	// 每页的数量
	@ApiModelProperty(value = "每页的数量",example = "10")
	@Transient
	private Integer limit;
	
	// 排序方式
	@ApiModelProperty(value = "排序方式")
	@Transient
	@JsonIgnore
	private String order;
	 
}
