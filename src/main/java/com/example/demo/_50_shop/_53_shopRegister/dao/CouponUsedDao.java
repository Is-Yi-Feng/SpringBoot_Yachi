package com.example.demo._50_shop._53_shopRegister.dao;

import java.util.List;

public interface CouponUsedDao {
	
	List<Number> getDataFromSex(int shopId);
	
	Number getDataFromCoupon(int couponId, int shopId);
	
	Number getDataFromTime(String begin, String end, int shopId);
	
	Number getDataFromAge(String begin, String end, int shopId);
	

}
