package com.it.cf.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


import com.it.cf.admin.controller.AdminLoginInterceptor;
import com.it.cf.user.controller.LoginInterceptor;


@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
	registry.addInterceptor(new LoginInterceptor())
	.excludePathPatterns("/cfmember/cfLogin","/cfmember/register")
	.addPathPatterns("/cfmember/*");
		
	registry.addInterceptor(new AdminLoginInterceptor())
	.excludePathPatterns("/admin/login/adminLogin")
	.addPathPatterns("/admin/**");


	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
			= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(2 * 1024 * 1024); // 파일당 업로드 크기 제한 (2MB)
		
		return multipartResolver;
	}
	
}
