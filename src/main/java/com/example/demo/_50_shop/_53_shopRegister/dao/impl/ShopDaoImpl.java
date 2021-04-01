package com.example.demo._50_shop._53_shopRegister.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._50_shop._53_shopRegister.dao.ShopDao;


@Repository
public class ShopDaoImpl implements ShopDao{
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	@Override
	public int saveShop(ShopBean shop) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(shop);
		n++;
		return n;
	}

	@Override
	public ShopBean getShop(int shopId) {
		Session session = factory.getCurrentSession();
		ShopBean sb = session.get(ShopBean.class, shopId);
		return sb;
	}

	@Override
	public int updateShop(ShopBean shop) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(shop);
		n++;
		return n;
	}

	@Override
	public ShopBean getShopByShopName(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ShopBean s WHERE s.shop_name = :mname";
		ShopBean sb = (ShopBean) session.createQuery(hql).setParameter("mname", name).getSingleResult();
		
		return sb;
	}

	@Override
	public List<ShopBean> getAllShops() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ShopBean";
		List<ShopBean> shops = (List<ShopBean>) session.createQuery(hql).getResultList();
		return shops;
	}


	
	@Override
	public List<ShopBean> getShopsByNightMarket(int marketId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ShopBean WHERE nightMarketBean.market_id = :mid";
		List<ShopBean> shops = session.createQuery(hql).setParameter("mid", marketId).getResultList();
		return shops;
	}
	
	

	

}
