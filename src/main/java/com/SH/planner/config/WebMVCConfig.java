package com.SH.planner.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.SH.planner.common.FileManagerService;
import com.SH.planner.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer{
	
	@Autowired
	PermissionInterceptor permissionInterceptor;
	
	// 컴퓨터(서버) 내의 특정 경로를 클라이언트(브라우저) 에서 특정 path로 접근하도록 하는 설
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**") // 클라이언트에서 접근하도록 하는 Path
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
	}
	
	
	// 비정상적인 경로 접속을 막기 위한  * interceptor 설정
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(permissionInterceptor)
		.addPathPatterns("/**") // 모든 path 가 인터셉터를 거쳐 수행하도록 설정
		.excludePathPatterns("/static/**", "/images/**", "/user/sign_out"); // 제외할 path 
	}
	

}
