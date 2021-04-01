package com.example.demo._30_coupon._32_searchCoupon.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._30_coupon._32_searchCoupon.service.SearchCouponService;


@Controller
@SessionAttributes(value = { "coupon", "allCoupon", "LoginOK" })
public class SearchCouponController {

//@Controller呼叫@Service呼叫@Repository(Dao)
	@Autowired
	SearchCouponService searchCouponService;
	

	@Autowired
	ServletContext context;
	

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/searchCoupons")
	public String getCouponByCouponName(@RequestParam String coupon_Name ,Model model) {
				System.out.println("coupon_Name==========" + coupon_Name);
		List<CouponBean> coupons = searchCouponService.getCouponByCouponName(coupon_Name);
		model.addAttribute("coupons",coupons);
		return "_15_coupon/coupons";
	}

}
