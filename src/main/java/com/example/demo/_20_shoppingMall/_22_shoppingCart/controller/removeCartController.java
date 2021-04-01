package com.example.demo._20_shoppingMall._22_shoppingCart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo._20_shoppingMall._22_shoppingCart.service.CartBeanService;

@Controller
@SessionAttributes({"cartList"})
public class removeCartController {
	@Autowired
	CartBeanService cartBeanService;
	
	//移除session的cartList必須在另一個 controller移除
	//否則連會員 與 頁數 也會被一同移除
	//刪除一筆購物車紀錄(根據id刪除)
		@SuppressWarnings("null")
		@DeleteMapping("/cartDelete/{cart_id}")
		public String deleteCart(
				@PathVariable Integer cart_id, HttpSession session, Model model,
				SessionStatus status
				) {
			cartBeanService.deleteCart(cart_id);
			status.setComplete();
//			Member member = (Member) session.getAttribute("LoginOK");
//			List<CartBean> cartBeans = cartBeanService.findCartByMemberId(member.getMemberId());
//			List<MemberCartBeanVo> memberCartVoList = cartBeanService.getMemberCartVo(member.getMemberId());
			
//			List<MemberCartBeanVo> memberCartVoList = cartBeanService.getMemberCartVo(member.getMemberId());
//			model.addAttribute("memberCartVoList", memberCartVoList);
//			session.getAttribute("memberCartVoList");
			
//			List<MemberCartBeanVo> memberCartBeanVoList = null;
//			for(CartBean cart : cartBeans) {
//				MemberCartBeanVo memberCartBeanVo = null;
//				memberCartBeanVo.setProduct_name(cart.getProductBean().getProduct_name());
//				memberCartBeanVo.setProduct_spec(cart.getProductBean().getProduct_spec());
//				memberCartBeanVo.setProduct_stock(cart.getProductBean().getProduct_stock());
//				memberCartBeanVo.setProduct_pic(cart.getProductBean().getProduct_pic());
//				memberCartBeanVo.setProduct_price(cart.getProductBean().getProduct_price());
//				memberCartBeanVoList.add(memberCartBeanVo);
//			}
			
			
//			model.addAttribute("memberCartVoList", memberCartVoList);
			
			return "redirect:/showCartContent";
		}

		@GetMapping("/cartDeleteFromDatabase")
		public String deleteCartByMemberId(Model model,SessionStatus status) {
			status.setComplete();
			return "redirect:/cartDeleteFromVo";  //清掉會員購物車的session，也需要清掉vo的session，故導向cartDeleteFromVo
		}
		
}
