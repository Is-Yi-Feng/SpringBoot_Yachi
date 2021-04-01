package com.example.demo._50_shop._51_coupon.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.CouponUsedBean;
import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._50_shop._51_coupon.dao.CouponDao;
import com.example.demo._50_shop._51_coupon.service.CouponService;



@Transactional
@Service
public class CouponServiceImpl implements CouponService{
	
	@Autowired
	CouponDao couponDao;

	@Override
	public CouponBean getCoupon(int couponId) {
		
		return couponDao.getCoupon(couponId);
	}
	
	public ShopBean getShop(int shopId){
		
		return couponDao.getShop(shopId);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int saveCoupon(CouponBean bean) {
		
		return couponDao.saveCoupon(bean);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CouponBean> getAllCoupons() {
		
		return couponDao.getAllCoupons();
	}
	
	@Override
	public List<CouponBean> getShopCoupons(int shopId) {
		
		return couponDao.getShopCoupons(shopId);
	}
	
	@Override
	public int updateCoupon(CouponBean bean) {
		
		return couponDao.updateCoupon(bean);
	}

	@Transactional
	@Override
	public int deleteCoupon(int couponId) {
		
		return couponDao.deleteCoupon(couponId);
	}
	

	@Override
	public void saveCouponUsed(CouponUsedBean couponUsedBean){
		couponDao.saveCouponUsed(couponUsedBean);

	}
	
	

}
