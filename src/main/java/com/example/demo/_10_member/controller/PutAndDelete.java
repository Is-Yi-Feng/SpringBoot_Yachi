package com.example.demo._10_member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PutAndDelete {
	
	 @GetMapping("/httpMethod")
	 public String httpMethd(){
	 return "PutTest";
	 }
	
	 @PostMapping("/httpMethod")
	 @ResponseBody
	 public String httpMethod(@RequestParam String name,@RequestParam String pwd){
	 System.out.println("sent name is " +name);
	 System.out.println("sent pwd is " +pwd);
	 return "Post成功";
	 }

	 @PutMapping("/httpMethod")
	 @ResponseBody
	 public String httpMethodPut(@RequestParam String name,@RequestParam String pwd){
	 System.out.println("put sent name is "+ name);
	 System.out.println("put sent pwd is "+pwd);
	 return "Put成功";
	 }
	
	 @DeleteMapping("/httpMethod")
	 @ResponseBody
	 public String httpMethodDel(@RequestParam String name,@RequestParam String pwd){
	 System.out.println("delete sent name is "+name);
	 System.out.println("delete sent pwd is "+pwd);
	 return "Delete成功";
	 }
}
