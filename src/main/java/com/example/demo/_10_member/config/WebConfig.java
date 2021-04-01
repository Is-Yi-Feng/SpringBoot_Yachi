package com.example.demo._10_member.config;



import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	// JSP 必須加上這個配置 讓Security給的login重新導向自定義的login
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		
		
		registry.addViewController("/").setViewName("redirect:/login-view");
		registry.addViewController("/login-view").setViewName("LoginAndRegister");

	}
	

	
}
