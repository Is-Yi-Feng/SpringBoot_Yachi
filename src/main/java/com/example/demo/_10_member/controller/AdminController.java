package com.example.demo._10_member.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo._10_member.service.MemberServiceImpl;


@RestController
@SessionAttributes("member")
public class AdminController {

	@Autowired
	MemberServiceImpl memberServiceImpl;
	
	@RequestMapping("/admin")
	public String admin() {
		
		return "這裡是管理員的頁面，只有管理員才能訪問";
		
	}
	
	
	@RequestMapping(value = "/test",params = {"username","age != 12"})
	public String test() {
		return "測試成功";
	}
	
	@RequestMapping("/test01")
	public String test01() {
		return "你沒有權限訪問此頁面";
	}
	

}
