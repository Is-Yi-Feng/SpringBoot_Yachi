package com.example.demo._20_shoppingMall._23_orderProcess.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo._02_model.entity.OrderBean;
import com.example.demo._20_shoppingMall._23_orderProcess.service.OrderService;

@Controller
@RequestMapping("_23_orderProcess")
@SessionAttributes({"LoginOK"})
public class SerachOrderController {
	@Autowired
	OrderService orderService;
	
	
	@RequestMapping("/queryOrder/{orderNumber}")
	public @ResponseBody OrderBean queryOrderByMid(
			Model model,
			@PathVariable("orderNumber") String orderNumber){
//		Member member = (Member) model.getAttribute("LoginOK");
//		List<OrderBean> ordersByMember = orderService.getAllOrdersByMemberId(member.getMemberId());
		OrderBean queryOrder = new OrderBean();
//		for(OrderBean order : ordersByMember) {
//			if(orderNumber == order.getOrderNumber())
			queryOrder = orderService.queryOrder(orderNumber);
//		}
		return queryOrder;
	}
	
	
	
}
