package com.example.demo._30_coupon._33_editCoupon.service;

import java.util.List;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.FavoriteCouponListBean;
import com.example.demo._10_member.entity.Member;


public interface FavoriteCouponService {
	
	public int saveFavoriteCoupon(CouponBean couponBean, Member member);
	
	public List<FavoriteCouponListBean> getFavoriteCouponByMemberId(Integer memberId);
	
	public void deleteSingleFavoriteCouponByMemberId(Integer memberId,Integer coupon_id);


}
