package com.example.demo._10_member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo._10_member.entity.Member;




@Controller
@SessionAttributes("LoginOK")
public class WebsocketController {

	@Bean
	public MyWebSocketHandler infoHandler() {
		return new MyWebSocketHandler();
	}

	@RequestMapping("/websocket/login")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		Member memberBean = (Member) model.getAttribute("LoginOK");
//		String userName = request.getParameter("userName");
		String userName = memberBean.getUsername();
		System.out.println(userName + "登錄");
		HttpSession session = request.getSession(false);
		session.setAttribute("123", userName);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ws");

		return "/_11_member/chatroom";
	}
}
