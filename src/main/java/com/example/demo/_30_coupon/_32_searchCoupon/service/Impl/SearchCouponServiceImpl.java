package com.example.demo._30_coupon._32_searchCoupon.service.Impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._30_coupon._32_searchCoupon.dao.SearchCouponDao;
import com.example.demo._30_coupon._32_searchCoupon.service.SearchCouponService;
//@Transactional
@Service
public class SearchCouponServiceImpl implements SearchCouponService{
	

	@Autowired
	SearchCouponDao searchCouponDao;
	
//	==========================找出memberId的FavoriteShopListBean對應表單所有資訊================================================
	@Override
//	public List<Map<String,Object>> getCouponByCouponName(String coupon_Name) {
	
		public List<CouponBean> getCouponByCouponName(String coupon_Name){
		
		return searchCouponDao.getCouponByCouponName(coupon_Name);
	}
	
	
	
}
