package com.example.demo._50_shop._51_coupon.dao;

import java.util.List;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.CouponUsedBean;
import com.example.demo._02_model.entity.ShopBean;



public interface CouponDao {

	CouponBean getCoupon(int couponId);
	
	public ShopBean getShop(int shopId);
	
	int saveCoupon (CouponBean bean);
	
	List<CouponBean> getAllCoupons();
	
	List<CouponBean> getShopCoupons(int shopId);
	
	int updateCoupon(CouponBean bean);
	
	int deleteCoupon(int couponId);

	public void saveCouponUsed(CouponUsedBean couponUsedBean);
	
	

}
