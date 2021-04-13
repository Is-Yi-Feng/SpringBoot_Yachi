package com.example.demo.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo._10_member.entity.Member;

@Controller
public class memTest {

	@Autowired
	memberTestService memberTestService;
	
	@RequestMapping("/abc")
	@ResponseBody
	public String mem(Integer id) {
		
		Member member = memberTestService.getMember(id);
		member.setFullname("小夫");
		memberTestService.update(member);
				
		return "測試成功"+member.getFullname();
	}
	
	@RequestMapping("/abc2")
	@ResponseBody
	public String mem2(String name) {
		
		 List<Member> list = memberTestService.getMember2(name);
		 for (Member member : list) {
			
			System.out.println(member.getFullname());
		}
				
		return "測試成功";
	}
}





