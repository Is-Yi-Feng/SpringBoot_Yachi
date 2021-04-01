package com.example.demo._30_coupon._33_editCoupon.dao;

import java.util.List;

import com.example.demo._02_model.entity.FavoriteCouponListBean;

public interface  FavoriteCouponDao {
	public int saveFavoriteCoupon(FavoriteCouponListBean favoriteCouponListBean);
	 
	public int updateFavoriteCoupon(FavoriteCouponListBean favoriteCouponListBean);
	
	public List<FavoriteCouponListBean> getFavoriteCouponByMemberId(Integer memberId);
	
	public void deleteSingleFavoriteCouponByMemberId(Integer memberId,Integer coupon_id);

	

	
}
