package com.example.demo._50_shop._53_shopRegister.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._50_shop._51_coupon.service.CouponService;
import com.example.demo._50_shop._53_shopRegister.service.CouponUsedService;

@Controller
@RequestMapping("/_50_shop/_55_shopData")
@SessionAttributes({"LoginOK"})
public class ShopDataController {
	
	@Autowired
	CouponUsedService couponUsedService;
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	ServletContext context;
	
	String[] color = {"\"#CAFFFF\"", "\"#BBFFBB\"", "\"#FFAF60\"", "\"#FF9797\"","\"#CDCD9A\""};
	String[] month = {"\"一月\"","\"二月\"","\"三月\""};
	String[] Age = {"\"0-20歲\"","\"20-40歲\"","\"40-60歲\"","\"60-80歲\""};
	
	@RequestMapping("/DataFromSex")		
	public String DataFromSex(Model model) {  //有東西要交給view 就放model
		List<Number> data = couponUsedService.getDataFromSex(1);
		List<String> label = new LinkedList<String>();
		label.add("\"男\"");
		label.add("\"女\"");
		List<String> backgroundColor = new LinkedList<String>();
		backgroundColor.add("\"#C4E1FF\"");
		backgroundColor.add("\"#FFD2D2\"");
		model.addAttribute("type", "\"pie\"");
		model.addAttribute("text", "\"男女顧客比\"");
		model.addAttribute("data",data);
		model.addAttribute("label",label);
		model.addAttribute("backgroundColor",backgroundColor);
		model.addAttribute("detail","＊此表顯示為店家優惠券使用者的男女比例");
		return "_50_shop/_53_shopRegister/ShopData"; 
	}
	
	@RequestMapping("/DataFromCoupon")		
	public String DataFromCoupon(Model model) {  //有東西要交給view 就放model
		List<CouponBean> coupons = couponService.getShopCoupons(1);
		List<String> couponName = new LinkedList<String>();
		for (CouponBean cb : coupons) {
			couponName.add("\"" + cb.getCoupon_name() + "\"");
		}
		List<Number> data = couponUsedService.getDataFromCoupon(1);
		
		List<String> backgroundColor = new LinkedList<String>();
		for (int i = 0; i < coupons.size(); i++) {
			backgroundColor.add(color[i]);
		}
		model.addAttribute("text", "\"優惠券被使用次數\"");
		model.addAttribute("type", "\"bar\"");
		model.addAttribute("data",data);
		model.addAttribute("label",couponName);
		model.addAttribute("backgroundColor",backgroundColor);
		model.addAttribute("detail","＊此表顯示為店家各種優惠券的使用次數");
		return "_50_shop/_53_shopRegister/ShopData"; 
	}
	
	@RequestMapping("/DataFromTime")		
	public String DataFromTime(Model model) {  //有東西要交給view 就放model
		List<Number> data = couponUsedService.getDataFromTime(1);
		List<String> backgroundColor = new LinkedList<String>();
		for (int i = 0; i < 3; i++) {
			backgroundColor.add(color[i]);
		}
		List<String> label = new LinkedList<String>();
		for (int i = 0; i < month.length; i++) {
			label.add(month[i]);
		}
		model.addAttribute("text", "\"期間優惠券被使用次數\"");
		model.addAttribute("type", "\"bar\"");
		model.addAttribute("data",data);
		model.addAttribute("label",label);
		model.addAttribute("backgroundColor",backgroundColor);
		model.addAttribute("detail","＊此表顯示為店家近三個月的所有優惠券被使用次數");
		return "_50_shop/_53_shopRegister/ShopData"; 
	}
	
	@RequestMapping("/DataFromAge")		
	public String DataFromAge(Model model) {  //有東西要交給view 就放model
		List<Number> data = couponUsedService.getDataFromAge(1);
		List<String> backgroundColor = new LinkedList<String>();
		for (int i = 0; i < 4; i++) {
			backgroundColor.add(color[i]);
		}
		List<String> label = new LinkedList<String>();
		for (int i = 0; i < Age.length; i++) {
			label.add(Age[i]);
		}
		model.addAttribute("text", "\"顧客年齡分佈\"");
		model.addAttribute("type", "\"bar\"");
		model.addAttribute("data",data);
		model.addAttribute("label",label);
		model.addAttribute("backgroundColor",backgroundColor);
		model.addAttribute("detail","＊此表顯示為店家優惠券使用者的年齡分佈");
		return "_50_shop/_53_shopRegister/ShopData"; 
	}
	
	@RequestMapping("/DataFromAll")		
	public String DataFromAll(Model model) {  //有東西要交給view 就放model
		List<Number> data = couponUsedService.getDataFromSex(1);
		List<String> label = new LinkedList<String>();
		label.add("\"男\"");
		label.add("\"女\"");
		List<String> backgroundColor = new LinkedList<String>();
		backgroundColor.add("\"#C4E1FF\"");
		backgroundColor.add("\"#FFD2D2\"");
		model.addAttribute("type", "\"pie\"");
		model.addAttribute("text", "\"男女顧客比\"");
		model.addAttribute("data",data);
		model.addAttribute("label",label);
		model.addAttribute("backgroundColor",backgroundColor);
		//-------------------------------------------------------
		List<Number> data1 = couponUsedService.getDataFromAge(1);
		List<String> backgroundColor1 = new LinkedList<String>();
		for (int i = 0; i < 4; i++) {
			backgroundColor1.add(color[i]);
		}
		List<String> label1 = new LinkedList<String>();
		for (int i = 0; i < Age.length; i++) {
			label1.add(Age[i]);
		}
		model.addAttribute("text1", "\"顧客年齡分佈\"");
		model.addAttribute("type1", "\"bar\"");
		model.addAttribute("data1",data1);
		model.addAttribute("label1",label1);
		model.addAttribute("backgroundColor1",backgroundColor1);
		//-------------------------------------------------------
		List<CouponBean> coupons = couponService.getShopCoupons(1);
		List<String> couponName = new LinkedList<String>();
		for (CouponBean cb : coupons) {
			couponName.add("\"" + cb.getCoupon_name() + "\"");
		}
		List<Number> data2 = couponUsedService.getDataFromCoupon(1);
		
		List<String> backgroundColor2 = new LinkedList<String>();
		for (int i = 0; i < coupons.size(); i++) {
			backgroundColor2.add(color[i]);
		}
		model.addAttribute("text2", "\"優惠券被使用次數\"");
		model.addAttribute("type2", "\"bar\"");
		model.addAttribute("data2",data2);
		model.addAttribute("label2",couponName);
		model.addAttribute("backgroundColor2",backgroundColor2);
		//-------------------------------------------------------
		List<Number> data3 = couponUsedService.getDataFromTime(1);
		List<String> backgroundColor3 = new LinkedList<String>();
		for (int i = 0; i < 3; i++) {
			backgroundColor3.add(color[i]);
		}
		List<String> label3 = new LinkedList<String>();
		for (int i = 0; i < month.length; i++) {
			label3.add(month[i]);
		}
		model.addAttribute("text3", "\"期間優惠券被使用次數\"");
		model.addAttribute("type3", "\"bar\"");
		model.addAttribute("data3",data3);
		model.addAttribute("label3",label3);
		model.addAttribute("backgroundColor3",backgroundColor3);
		
		return "_50_shop/_53_shopRegister/ShopAllData"; 
	}
	
	

}
