package com.example.demo._50_shop._53_shopRegister.dao.impl;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._50_shop._51_coupon.dao.CouponDao;
import com.example.demo._50_shop._53_shopRegister.dao.CouponUsedDao;

@Repository
public class CouponUsedDaoImpl implements CouponUsedDao{	
	
	@Autowired
	Springboot2Hibernate5 factory;

	@Override
	public List<Number> getDataFromSex(int shopId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM CouponUsedBean c WHERE c.memberBean.sex = :sid AND c.shopBean.shop_id = :mid";	
		String hql1 = "SELECT COUNT(*) FROM CouponUsedBean c WHERE c.memberBean.sex = :sid AND c.shopBean.shop_id = :mid";	
		Number a = (Number) session.createQuery(hql).setParameter("sid", "male").setParameter("mid", 1).uniqueResult();
		Number b = (Number) session.createQuery(hql).setParameter("sid", "female").setParameter("mid", 1).uniqueResult();
		List<Number> sex = new LinkedList<Number>();
		sex.add(a);
		sex.add(b);
		return sex;
	}

	@Override
	public Number getDataFromCoupon(int couponId,int shopId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM CouponUsedBean c WHERE c.couponBean.coupon_id = :sid AND c.shopBean.shop_id = :mid";		
		Number a = (Number) session.createQuery(hql).setParameter("sid", couponId).setParameter("mid", 1).uniqueResult();
		return a;
	}

	@Override
	public Number getDataFromTime(String begin, String end, int shopId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM CouponUsedBean c WHERE c.coupon_used_time > :sid AND c.coupon_used_time < :mid AND c.shopBean.shop_id = :cid";	
		Number a = (Number) session.createQuery(hql).setParameter("sid", java.sql.Timestamp.valueOf(begin))
								   					.setParameter("mid", java.sql.Timestamp.valueOf(end))
								   					.setParameter("cid", 1)
								   					.uniqueResult();
		return a;
	}

	@Override
	public Number getDataFromAge(String begin, String end, int shopId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM CouponUsedBean c WHERE c.memberBean.birthday > :bid AND c.memberBean.birthday < :eid AND c.shopBean.shop_id = :sid";	
		Number a = (Number) session.createQuery(hql).setParameter("bid", java.sql.Date.valueOf(end))
													.setParameter("eid", java.sql.Date.valueOf(begin))
													.setParameter("sid", 1)
													.uniqueResult();
		return a;
	}

}
