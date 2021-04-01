package com.example.demo._30_coupon._32_searchCoupon.service;

import java.util.List;

import com.example.demo._02_model.entity.CouponBean;

public interface  SearchCouponService {
	
//	public List<Map<String,Object>> getCouponByCouponName(String coupon_Name);
	
	public List<CouponBean> getCouponByCouponName(String coupon_Name);

	

	
}
