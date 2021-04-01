package com.example.demo._20_shoppingMall._23_orderProcess.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo._02_model.entity.CartBean;
import com.example.demo._02_model.entity.OrderBean;
import com.example.demo._02_model.entity.PayTypeBean;
import com.example.demo._02_model.entity.ShipTypeBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._20_shoppingMall._23_orderProcess.mail.SendingOrderSuccessEmail;
import com.example.demo._20_shoppingMall._23_orderProcess.service.OrderService;
import com.example.demo._20_shoppingMall._23_orderProcess.service.PayTypeService;
import com.example.demo._20_shoppingMall._23_orderProcess.service.ShipTypeService;
import com.example.demo._20_shoppingMall._23_orderProcess.validator.OrderValidator;

@Controller
@SessionAttributes({"LoginOK", "pageNo","cartList","orderBeanNew"})
public class ProcessOrderController {
	@Autowired
	ShipTypeService shipTypeService;
	@Autowired
	PayTypeService payTypeService;
	@Autowired
	OrderService orderService;
	
	//轉向資料填寫頁面
	@GetMapping("/checkout")
	public String showOrderDetail(Model model, SessionStatus status) {
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			status.setComplete();
			return "redirect:/LoginAndRegister";
		}
		OrderBean orderBean = new OrderBean();
//		orderBean.setCompany_id("11123456");
		model.addAttribute("orderBean", orderBean);
		return "_12_shoppingmall/6_orderDetail";
	}
	
	/**
	 * 創建訂單(必須同時成功或失敗)
	 * 1. 新增訂單紀錄
	 * 2. 新增訂單明細紀錄
	 * 3. 清除使用者購物車表格紀錄
	 */
	
	//提交表單控制器方法
	@SuppressWarnings("unchecked")
	@PostMapping("/checkout")
	public String processCreateOrder(
			Model model,
			@Valid @ModelAttribute("orderBean") OrderBean orderBean,
			BindingResult result,
			RedirectAttributes redirectAttributes,
			HttpServletRequest request
			) {
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			return "redirect:/LoginAndRegister";
		}
		
		//設定表單資料檢查條件
		OrderValidator validator= new OrderValidator();
		validator.validate(orderBean, result);
		if(result.hasErrors()) {
			List<ObjectError> list =  result.getAllErrors();//把所有錯誤裝在list裡面
			for(ObjectError error : list) {
				System.out.println("====>有錯誤:" + error);
			}
			return "_12_shoppingmall/6_orderDetail";
		}
		
		//取得購物車總金額
		double total = 0;
		List<CartBean> carts = (List<CartBean>) model.getAttribute("cartList");
		for(CartBean cart: carts) {
			total += cart.getCart_total();
		}                             
		
		//將訂單資訊加入未在表單綁定的訂單屬性(total與member資料)
		orderBean.setMemberBean(member);
		orderBean.setOrder_total(total);
		
//		orderService.createOrder(orderBean); //還需檢查庫存量
		try {
			OrderBean orderBeanNew = orderService.createOrder(orderBean); //新建訂單三步驟
			System.out.println("orderBeanN 訂單編號 %%%%%%%%% ========>" + orderBeanNew.getOrderNumber());
			
			SendingOrderSuccessEmail sendingOrderSuccessEmail = new SendingOrderSuccessEmail(member.getEmail(), orderBeanNew);
			sendingOrderSuccessEmail.sendAcceptMail();
			model.addAttribute("orderBeanNew", orderBeanNew);
			System.out.println("======訂單新建成功======"); //尚須捕捉例外
			return "redirect:/cartDeleteFromDatabase";
		} catch (RuntimeException e) {
			System.out.println("===========================" +e.getMessage() + "===================");
//			redirectAttributes.addFlashAttribute("stockShortage", e.getMessage()); //只會出現一次
			return "redirect:/showCartContent";
		}
		
	}
	
	//訂單成功頁面
	@GetMapping("/successOrder")
	public String orderSuccess(Model model) {
		OrderBean orderBeanNew = (OrderBean) model.getAttribute("orderBeanNew");
		model.addAttribute("orderBeanNew", orderBeanNew);
		return "_12_shoppingmall/12_finish_order";
	}
	
	//取消訂單
	@GetMapping("/cancelOrder/asdf9{order_id}8")
	public String memberCancelOrder(
			Model model,
			@PathVariable Integer order_id) {
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			return "redirect:/LoginAndRegister";
		}
		// 1. 取得當前訂單
		OrderBean orderBean = orderService.getOrderById(order_id);
		// 2. 更新此筆訂單狀態為取消
		orderService.cancelOrder(orderBean);
		return "redirect:/_23_orderProcess/orderList";
	}
	
	
	
	
	
	
	
	
	

	//取貨方式下拉式選單資料
	@ModelAttribute("shipTypeMap")
	public Map<Integer, String> getShipTypeList(){
		Map<Integer, String> sortMap = new HashMap<>();
		List<ShipTypeBean> list = shipTypeService.getAllShipTypes();
		for(ShipTypeBean shiptype : list) {
			sortMap.put(shiptype.getShip_type_id(),shiptype.getType_name());
		}
		return sortMap;
	}
	
	//付款方式下拉式選單資料
	@ModelAttribute("payTypeMap")
	public Map<Integer, String> getPayTypeList() {
		Map<Integer, String> sortMap = new HashMap<>();
		List<PayTypeBean> list = payTypeService.getAllPayTypes();
		for(PayTypeBean paytype : list) {
			sortMap.put(paytype.getPay_type_id(),paytype.getPay_type_name());
		}
		return sortMap;
	}
	
	

	
	
	
}
