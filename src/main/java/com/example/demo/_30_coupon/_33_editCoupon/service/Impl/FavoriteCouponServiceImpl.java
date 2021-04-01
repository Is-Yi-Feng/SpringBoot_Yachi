package com.example.demo._30_coupon._33_editCoupon.service.Impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.FavoriteCouponListBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._30_coupon._33_editCoupon.dao.FavoriteCouponDao;
import com.example.demo._30_coupon._33_editCoupon.service.FavoriteCouponService;
import com.example.demo._50_shop._51_coupon.dao.CouponDao;

@Transactional
@Service
public class FavoriteCouponServiceImpl implements FavoriteCouponService{
	
	
	@Autowired
	FavoriteCouponDao favoriteCouponDao;

	@Override
	public int saveFavoriteCoupon(CouponBean couponBean, Member member){
		int n = 0;
		
		List<FavoriteCouponListBean> fclb = favoriteCouponDao.getFavoriteCouponByMemberId(member.getMemberId());
		
		
		if(fclb.size() == 0) {
			Set<CouponBean> sbl = new HashSet<CouponBean>();
			sbl.add(couponBean);
			FavoriteCouponListBean fcb = new FavoriteCouponListBean();
			fcb.setMemberBean(member);
			fcb.setCoupons(sbl);
			favoriteCouponDao.saveFavoriteCoupon(fcb);
		}else {
			Set<CouponBean> sbl = new HashSet<>();
			FavoriteCouponListBean tempfcb = new FavoriteCouponListBean();
			for(FavoriteCouponListBean fcb : fclb ) {
				tempfcb = fcb;
				sbl = tempfcb.getCoupons();
			}
			sbl.add(couponBean);
			tempfcb.setCoupons(sbl);
			favoriteCouponDao.updateFavoriteCoupon(tempfcb);
			n++;
		}
		return n;
	}


	@Override
	public List<FavoriteCouponListBean> getFavoriteCouponByMemberId(Integer memberId) {

		List<FavoriteCouponListBean> list = favoriteCouponDao.getFavoriteCouponByMemberId(memberId);
		
		return list;
	}


	@Override
	public void deleteSingleFavoriteCouponByMemberId(Integer memberId, Integer coupon_id) {

		favoriteCouponDao.deleteSingleFavoriteCouponByMemberId(memberId, coupon_id);
	}
	
	
}
