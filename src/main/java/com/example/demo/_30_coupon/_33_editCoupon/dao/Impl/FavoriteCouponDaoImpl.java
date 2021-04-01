package com.example.demo._30_coupon._33_editCoupon.dao.Impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.FavoriteCouponListBean;
import com.example.demo._30_coupon._33_editCoupon.dao.FavoriteCouponDao;

@Repository
public class FavoriteCouponDaoImpl implements FavoriteCouponDao{
	
	@Autowired
	Springboot2Hibernate5 factory;
		
	@Override
	public int saveFavoriteCoupon(FavoriteCouponListBean favoriteCouponListBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(favoriteCouponListBean);
		n++;
		return n;
	}
	
	@Override
	public int updateFavoriteCoupon(FavoriteCouponListBean favoriteCouponListBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(favoriteCouponListBean);
		n++;
		return n;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FavoriteCouponListBean> getFavoriteCouponByMemberId(Integer memberId) {
        Session session = factory.getCurrentSession();
        String hql = "FROM FavoriteCouponListBean  WHERE memberBean.memberId = :mid";
        
        	List<FavoriteCouponListBean> fslb = session.createQuery(hql)
            			  .setParameter("mid", memberId)
            			  .getResultList();   
		return fslb;
	}
	

	@Override
	public void deleteSingleFavoriteCouponByMemberId(Integer memberId, Integer coupon_id ) {
		
        Session session = factory.getCurrentSession();
        
		CouponBean cp = session.get(CouponBean.class, coupon_id);
 
		String hql = "FROM FavoriteCouponListBean WHERE memberBean.memberId = :mid";
		
		FavoriteCouponListBean favoriteCouponListBean = new FavoriteCouponListBean();
		
		try {
			favoriteCouponListBean = (FavoriteCouponListBean) session.createQuery(hql)
												.setParameter("mid", memberId)
												.getSingleResult();
		} catch (Exception e) {

		}	
		Set<CouponBean> coupons = new HashSet<CouponBean>();
		coupons = favoriteCouponListBean.getCoupons();		
		coupons.remove(cp);		
		favoriteCouponListBean.setCoupons(coupons);
		
		session.update(favoriteCouponListBean);
		
	}
	
	
	
}
