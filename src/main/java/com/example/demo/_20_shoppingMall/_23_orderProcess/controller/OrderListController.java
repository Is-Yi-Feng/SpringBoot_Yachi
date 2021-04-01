package com.example.demo._20_shoppingMall._23_orderProcess.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo._02_model.entity.OrderBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._20_shoppingMall._23_orderProcess.service.OrderService;

@Controller
@SessionAttributes({ "LoginOK", "products_DPP"})
@RequestMapping("_23_orderProcess")
public class OrderListController {
	@Autowired
	OrderService orderService;
	
	@GetMapping("orderList")
	public String orderList(Model model) {
		Member member = (Member) model.getAttribute("LoginOK");
		if(member == null) {
			return "redirect:/LoginAndRegister";
		}
		List<OrderBean> memberOrders = orderService.getAllOrdersByMemberId(member.getMemberId());
		Collections.reverse(memberOrders);
//		for(OrderBean pBean : memberOrders) {
//			System.out.println(pBean);
//		}
		model.addAttribute("memberOrders",memberOrders);
		return "_11_member/mamber_order";
	}
	
	
	//轉向訂單明細頁面
		@RequestMapping("/orderDetail")
		public String orderDetail(
				Model model,
				@RequestParam("orderNo") Integer orderNo
				) {
			Member member = (Member)model.getAttribute("LoginOK");
			if(member == null) {
				return "redirect:/LoginAndRegister";
			}
			
			OrderBean orderBean = orderService.getOrderById(orderNo);
			model.addAttribute("orderBean", orderBean);
			
			return "_11_member/memberOrderDetail";
		}
	
}
