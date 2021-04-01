package com.example.demo._50_shop._53_shopRegister.service.impl;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._50_shop._51_coupon.dao.CouponDao;
import com.example.demo._50_shop._53_shopRegister.dao.CouponUsedDao;
import com.example.demo._50_shop._53_shopRegister.service.CouponUsedService;

@Transactional
@Service
public class CouponUsedServiceImpl implements CouponUsedService{
	
	@Autowired
	CouponDao couponDao;
	
	@Autowired
	CouponUsedDao couponUsedDao;

	@Override
	public List<Number> getDataFromSex(int shopId) {
		return couponUsedDao.getDataFromSex(shopId);
	}

	@Override
	public List<Number> getDataFromCoupon(int shopId) {
		List<CouponBean> coupons = couponDao.getShopCoupons(shopId);
		List<Number> data = new LinkedList<Number>();
		for (CouponBean couponBean : coupons) {
			Number a = couponUsedDao.getDataFromCoupon(couponBean.getCoupon_id(), shopId);
			data.add(a);
		}
		
		return data;
	}

	@Override
	public List<Number> getDataFromTime(int shopId) {
		String[] month = {"2021-01-01 00:00:00.000","2021-02-01 00:00:00.000","2021-03-01 00:00:00.000","2021-04-01 00:00:00.000"};
		List<Number> data = new LinkedList<Number>();
		for (int i = 0; i < 3; i++) {
			data.add(couponUsedDao.getDataFromTime(month[i], month[i+1], shopId));
		}
		return data;
	}

	@Override
	public List<Number> getDataFromAge(int shopId) {
		String[] range = {"2021-03-26","2001-03-26","1981-03-26","1961-03-26","1941-03-26",};
		List<Number> data = new LinkedList<Number>();
		for (int i = 0; i < 4; i++) {
			data.add(couponUsedDao.getDataFromAge(range[i], range[i+1], shopId));
		}
		return data;
	}

}
