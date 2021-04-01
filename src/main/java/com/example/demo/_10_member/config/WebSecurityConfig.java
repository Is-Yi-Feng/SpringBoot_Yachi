package com.example.demo._10_member.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	
		
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http
			.formLogin()
				.loginPage("/login-view") 
				.loginProcessingUrl("/doLogin") // form提交的url要和配置文件中的 loginProcessingUrl("")中的一致。
				.defaultSuccessUrl("/home")
				.failureUrl("/login-view?error=true")
				.and()
			.authorizeRequests()
				.antMatchers("/member/**").hasAnyAuthority("USER")
				.antMatchers("/admin/**").hasAnyAuthority("ADMIN")
				.anyRequest().permitAll()
				.and()
				.csrf().disable()
				.exceptionHandling().accessDeniedPage("/test01");
	}
	

	@Bean
	public PasswordEncoder passwordEncoder() {
		// 使用BCrypt加密
		return new BCryptPasswordEncoder();
	}
	
	@Override 
	public void configure(WebSecurity web) throws Exception{
		// 不攔截靜態資源
		web.ignoring().antMatchers("/static/**");
	}
	
	
}
