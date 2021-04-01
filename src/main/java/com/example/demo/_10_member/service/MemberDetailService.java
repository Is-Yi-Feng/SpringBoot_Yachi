package com.example.demo._10_member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo._10_member.entity.Member;
import com.example.demo._10_member.entity.Role;

/*
 * 
 * UserDetailsService負責取得UserDetails物件
 * UserDetails存放使用者資訊，使用者登入後放入Authentication物件中
 * 
 * 
 * */
@Service
public class MemberDetailService implements UserDetailsService {
	
	@Autowired
	MemberServiceImpl memberServiceImpl;	
	
	@Override
	public UserDetails loadUserByUsername(String username) {
			
		Member member = memberServiceImpl.findUsername(username);
		
		if(member == null) {
			
			throw new CredentialsExpiredException("查無帳號，請先去註冊");
		}	
		
		Integer status = member.getStatus();
		if (status == null) {

			throw new CredentialsExpiredException("該帳號的信箱尚未驗證");

		}
		
		Set<Role> roles = member.getRoles();
		List<String> list = new ArrayList<>();
			
		for (Role role : roles) {
			String role_code = role.getRole_code();
			list.add(role_code);
		}
		
		String[] permission = new String[list.size()];
		list.toArray(permission);

		UserDetails uDetails = User.withUsername(member.getUsername())
									.password(member.getPassword())
									.authorities(permission)
									.build();
		 
		System.out.println(uDetails);
		
		return uDetails;  
		
	}
	
	
}
