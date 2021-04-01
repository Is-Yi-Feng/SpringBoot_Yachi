package com.example.demo._20_shoppingMall._22_shoppingCart.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo._20_shoppingMall._22_shoppingCart.service.CartBeanService;
import com.example.demo._20_shoppingMall._22_shoppingCart.vo.SessionCartVo;
@Controller
@SessionAttributes({"memberCartVoList","sessionCartVoList","sessionCart"})
public class RemoveSideCartController {
	@Autowired
	CartBeanService cartBeanService;
	
	@GetMapping("/sideCartDel/{cart_id}/{member_id}")
	public String deleteSideCart(
			@PathVariable Integer cart_id,
			@PathVariable Integer member_id,
			SessionStatus status,
			Model model) {
		cartBeanService.deleteCart(cart_id);
//		Member member = cartBeanService.getMemberById(cart_id);
		
//		List<MemberCartBeanVo> memberCartVoList = cartBeanService.getMemberCartVo(member_id);
//		model.addAttribute("memberCartVoList", memberCartVoList);
//		status.setComplete();  不能加此行會把list全部刪掉
		return "redirect:/DisplayPageProducts";
	}
	@SuppressWarnings("unchecked")
	@GetMapping("/visitorSideCartDel/{product_id}/")
	public String deleteSideCartByVisitor(
			Model model,
			SessionStatus status,
			@PathVariable Integer product_id) {
//		status.setComplete();
//		List<SessionCartVo> sessionCartVoList = (List<SessionCartVo>) model.getAttribute("sessionCartVoList");
//		
//		for (Iterator<SessionCartVo> iter = sessionCartVoList.listIterator(); iter.hasNext(); ) {
//			SessionCartVo cart = iter.next();
//		    if (cart.getProduct_id() == product_id) {
//		        iter.remove();
//		    }
//		}
		
		//必須同時操作此二者
		Map<Integer, Integer> sessionCart = (Map<Integer, Integer>) model.getAttribute("sessionCart");
		if(sessionCart.get(product_id) != null) {
			sessionCart.remove(product_id);
		}
		model.addAttribute("sessionCart", sessionCart);
		List<SessionCartVo> sessionCartVoList = cartBeanService.getCartVo(sessionCart);
		model.addAttribute("sessionCartVoList", sessionCartVoList);
		

		
		return "redirect:/DisplayPageProducts";
	}
	
	//清掉vo的session，才能讓購物車側邊欄購物清單消失
	@GetMapping("/cartDeleteFromVo")
	public String deleteCartByMemberId(Model model,SessionStatus status) {
		status.setComplete();
		return "redirect:/successOrder";
	}
}
