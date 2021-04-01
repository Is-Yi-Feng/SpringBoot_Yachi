package com.example.demo._20_shoppingMall._22_shoppingCart.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo._02_model.entity.CartBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._20_shoppingMall._21_product.service.ProductService;
import com.example.demo._20_shoppingMall._22_shoppingCart.service.CartBeanService;
import com.example.demo._20_shoppingMall._22_shoppingCart.vo.MemberCartBeanVo;
import com.example.demo._20_shoppingMall._22_shoppingCart.vo.SessionCartVo;

@Controller													              
@SessionAttributes({"LoginOK", "pageNo","cartList","sortId","sessionCart","sessionCartVoList","memberCartVoList"})
public class ShoppingCartController {
	@Autowired
	CartBeanService cartBeanService;
	@Autowired
	ProductService productService;
	
	/**
	 * 會員：創建購物車
	 */
	
	@PostMapping("/BuyProduct.do")
	public String creatCart(
			Model model,
			@RequestParam(value = "cmd",required = false) String cmd,
			@RequestParam("product_id") Integer product_id,
			@RequestParam(value = "qty",required = false) Integer qty,
			@RequestParam(value = "sortId",required = false) Integer sortId,
			@RequestParam(value = "pageNo",required = false) String pageNo,
			HttpServletRequest request,
			HttpServletResponse response
			) throws ServletException, IOException {
		
		//1.判斷用戶是否存在
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			return "redirect:/LoginAndRegister";
		}
		HttpSession session = request.getSession(false); 
		if(session == null) {
			return "redirect:/LoginAndRegisters";
		}
		
		//獲取會員的id
		Integer memberId = member.getMemberId();
		//創建購物車(傳入會員編號, 產品編號, 數量)
		cartBeanService.addToCart(memberId, product_id, qty);
		List<MemberCartBeanVo> memberCartVoList = cartBeanService.getMemberCartVo(memberId);
		model.addAttribute("memberCartVoList", memberCartVoList);
		
		
		//得到當前加入購物車產品種類，目的為加入購物車後停留在當前種類頁面
//		Integer sort = productService.getProductById(product_id).getProductTypeBean().getProduct_type_id();
		Integer sessionSortId = (Integer) (model.getAttribute("sortId"));
//		String sessionPageNo = (String) (model.getAttribute("pageNo"));
		
		if(cmd.equalsIgnoreCase("ADD") && sortId == sessionSortId) {
			System.out.println(123);
			return "redirect:/sortId=" + sessionSortId;
		}
//		}else if(cmd.equalsIgnoreCase("ADD") && pageNo == sessionPageNo) {
//			System.out.println(456);
//			return "redirect:/DisplayPageProducts";
//		}
		else if(cmd.equalsIgnoreCase("ADD1")){
			return "redirect:/showCartContent";
		}
			
		return "redirect:/DisplayPageProducts";
		
	}

	
	/**
	 * 會員：顯示查看購物車
	 */
	@GetMapping("/showCartContent")
	public String showCartContent(
			Model model,
			SessionStatus status
			) {
		// STEP1:判斷用戶是否登入
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			//@SessionAttributes需要清除時，使用SessionStatus.setComplete();來清除。!它只清除@SessionAttributes的session，不會清除HttpSession的數據
//			status.setComplete();  //登入後還有這行會把session的購物車清掉
			return "redirect:/LoginAndRegister";
		}
		
		// STEP2:取得用戶id
		Integer memberId = member.getMemberId();
		
		// STEP3:根據用戶id，從cart表格撈取該用戶的購物車紀錄
		List<CartBean> carts = cartBeanService.findCartByMemberId(memberId);
		if(carts != null) {
			Collections.reverse(carts); //反轉順序，越新的在越上面
			model.addAttribute("cartList", carts);
		}
		return "_12_shoppingmall/5_cartContent";
	}
	
	
	/**
	 * 更新購物車數量
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/update/{cart_id}/{cart_amount}/{product_price}")
	public String updateCartAmount(
			Model model,
			@PathVariable Integer cart_id,
			@PathVariable Integer cart_amount,
			@PathVariable Double product_price
			) {
		// STEP1: 取出傳遞過來的參數(cart_id, cart_amount, product_price)
		//1.判斷用戶是否存在
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			return "redirect:/LoginAndRegister";
		}
//		Integer cid = (Integer) model.getAttribute("cart_id");
//		Integer amount = (Integer) model.getAttribute("cart_amount");
//		Double price = (Double) model.getAttribute("product_price");
		
		// STEP2: 更新購物車 
		cartBeanService.udateCartById(cart_id, cart_amount, product_price);
		
		return "forward:/showCartContent";
	}
	
	/**
	 * 訪客加入購物車
	 * step1 :參數需要產品id 與 購買數量
	 * step2 :將訪客的購買放入sessionCart(已準備好的map容器)
	 */
	@SuppressWarnings("unchecked")
	@PostMapping("/visitorBuyProduct.do")
	public String visitorAddToCart(Model model,
			@RequestParam(value = "cmd",required = false) String cmd,
			@RequestParam(value = "sortId",required = false) Integer sortId,
			@RequestParam("product_id") Integer product_id,
			@RequestParam(value = "pageNo",required = false) String pageNo,
			@RequestParam("qty") Integer qty) {
		
		//獲取session內的購物清單
		Map<Integer, Integer> sessionCart = (Map<Integer, Integer>) model.getAttribute("sessionCart");
		//如果session內的購物清單不為空
		if(sessionCart == null) {
			sessionCart = new LinkedHashMap<>();
			sessionCart.put(product_id, qty);
			model.addAttribute("sessionCart", sessionCart);
			System.err.println(sessionCart);
		}else {
			sessionCart.put(product_id, qty);
			model.addAttribute("sessionCart", sessionCart);
		}
		
		//使用value object類別 借放sessionCart 的產品資料，不直接操作entity
		List<SessionCartVo> sessionCartVoList = cartBeanService.getCartVo(sessionCart);
		
		model.addAttribute("sessionCart", sessionCart);
		model.addAttribute("sessionCartVoList", sessionCartVoList);
		System.out.println("sessionCartVoList=========================" + sessionCartVoList);
		
		Integer sessionSortId = (Integer) (model.getAttribute("sortId"));
//		String sessionPageNo = (String) model.getAttribute("pageNo");
		
		if(cmd.equalsIgnoreCase("ADD") && sortId == sessionSortId) {
			System.out.println(123);
			return "redirect:/sortId=" + sessionSortId;
		}
//		else if(cmd.equalsIgnoreCase("ADD") && pageNo == sessionPageNo) {
//			System.out.println(456);
//			return "redirect:/DisplayPageProducts";
//		}
		else if(cmd.equalsIgnoreCase("ADD1")){
			return "redirect:/showCartContent";
		}
		
		return "redirect:/DisplayPageProducts";
	}
	
	/**
	 * 將sessionCartList丟到CartBean
	 * 1. 判斷是否有登入
	 */
	
	// 右邊購物清單的前往結帳   // 尚未解決問題 前往結帳登入後 需跳轉至 showCartContent頁面
//	@SuppressWarnings("unchecked")
//	@GetMapping("/goCheckout")
//	public String sessionToCartBean(Model model,CartBean cartBean) {
//		//step1 : 判斷是否有登入
//		Member member = (Member)model.getAttribute("LoginOK");
//		if(member == null) {
//			return "redirect:/LoginAndRegister"; // 將sessionCartList丟到CartBean
//		}else {
//			return "redirect:/showCartContent";
//		}
//	}
	
	@GetMapping("/goCheckout")
	public String sessionToCartBean(Model model,CartBean cartBean) {
		
		//step1 : 交給過濾器去判斷是否有登入
		
		return "redirect:/showCartContent";
	}
	
	
	
	
	/**
	 * 顯示並加入購物車
	 */
//	@GetMapping("/showAndAddCart/{product_id}")
//	public String showAndAddCart(
//			Model model,
//			@RequestParam("qty") Integer qty,
//			@PathVariable("product_id") Integer product_id,
//			HttpServletRequest request,
//			HttpServletResponse response
//			) throws ServletException, IOException {
//		
//		//1.判斷用戶是否存在
//		Member member = (Member)model.getAttribute("LoginOK");
//		if(member == null) {
//			return "redirect:/LoginAndRegister";
//		}
//		//獲取會員的id
//		Integer memberId = member.getMemberId();
//		//創建購物車
//		cartBeanService.addToCart(memberId, product_id, qty);
//		return "redirect:/showCartContent";
//	}
	
	//刪除一筆購物車紀錄(根據id刪除)
//	@DeleteMapping("/cartDelete/{cart_id}")
//	public String deleteCart(
//			@PathVariable Integer cart_id,
//			SessionStatus status
//			) {
//		cartBeanService.deleteCart(cart_id);
//		status.setComplete();
//		return "redirect:/showCartContent";
//	}
	
		
	//透過此方式產生下拉選單數量的值
//	@ModelAttribute("qtyMap")
//	public Map<Integer,Integer> getQtyList(){
//		 Map<Integer, Integer> qtyMap = new HashMap<>();
//		 for(Integer i = 2; i <= 10; i++) {
//			 qtyMap.put(i, i);
//		 }
//		 return qtyMap;
//	}
	
	
	
	
	
	
	
}
