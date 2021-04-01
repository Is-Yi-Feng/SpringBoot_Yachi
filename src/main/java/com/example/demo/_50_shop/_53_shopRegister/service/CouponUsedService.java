package com.example.demo._50_shop._53_shopRegister.service;

import java.util.List;

public interface CouponUsedService {
	
	public List<Number> getDataFromSex(int shopId);
	
	public List<Number> getDataFromCoupon (int shopId);
	
	public List<Number> getDataFromTime (int shopId);
	
	public List<Number> getDataFromAge (int shopId);

}
