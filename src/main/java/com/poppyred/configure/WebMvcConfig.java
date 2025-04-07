package com.poppyred.configure;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //설정과 관련된 어노테이션
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Value("${project.uploadpath}")
	//application.properties에서 변수를 찾아서 값을 대입한다.
	String uploadPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/photo/**").addResourceLocations(uploadPath);
	}
}
