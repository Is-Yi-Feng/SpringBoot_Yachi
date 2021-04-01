package com.example.demo._50_shop._53_shopRegister.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.ShopCommentBean;
import com.example.demo._50_shop._53_shopRegister.dao.ShopCommentDao;
import com.example.demo._50_shop._53_shopRegister.dao.ShopDao;

@Repository
public class ShopCommentDaoImpl implements ShopCommentDao{
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	@Autowired
	ShopDao ShopDao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCommentBean> getShopCommentByShopId(int shopId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ShopCommentBean WHERE shopBean.shop_id = :sid";
		List<ShopCommentBean> scb = (List<ShopCommentBean>) session.createQuery(hql).setParameter("sid", shopId).getResultList();
		return scb;
	}

	@Override
	public int saveShopComment(ShopCommentBean shopCommentBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(shopCommentBean);
		n++;
		return n;
	}

	@Override
	public int updateShopComment(ShopCommentBean shopCommentBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(shopCommentBean);
		n++;
		return n;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCommentBean> getShopCommentByShopIdAndMemberId(int shopId, int memberId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ShopCommentBean WHERE memberBean.memberId = :mid AND shopBean.shop_id = :sid";
		List<ShopCommentBean> scb = (List<ShopCommentBean>) session.createQuery(hql).setParameter("mid", memberId).setParameter("sid", shopId).getResultList();
		
		return scb;
	}

	@Override
	public ShopCommentBean getShopCommentByCommentId(int CommentId) {
		Session session = factory.getCurrentSession();
		ShopCommentBean scb = session.get(ShopCommentBean.class, CommentId);
		return scb;
	}

	@Override
	public int getShopCommentCount(int shopId) {
		int n = 0;
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM ShopCommentBean WHERE shopBean.shop_id = :sid";
		Number n1 = (Number) session.createQuery(hql).setParameter("sid", shopId).uniqueResult();
		n = n1.intValue();
		return n;
	}

	@SuppressWarnings("unchecked")
	@Override
	public double getShopCommentTotalScore(int shopId) {
		Session session = factory.getCurrentSession();
		Number number = 0;
		String hql = "SELECT shop_score FROM ShopCommentBean WHERE shopBean.shop_id = :sid";
		List<Number> temp = session.createQuery(hql).setParameter("sid", shopId).getResultList();
		
		for(Number number2 :temp) {
			number = number.doubleValue() + number2.doubleValue();
		}
		
		return number.doubleValue();
	}
	
}
