package com.example.demo._50_shop._53_shopRegister.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.ShopTypeBean;
import com.example.demo._50_shop._53_shopRegister.dao.ShopTypeDao;



@Repository
public class ShopTypeDaoImpl implements ShopTypeDao{
		
	@Autowired
	Springboot2Hibernate5 factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopTypeBean> getShopType() {
		String hql = "FROM ShopTypeBean";
		Session session = factory.getCurrentSession();
		
		List<ShopTypeBean> list = session.createQuery(hql).getResultList();
		
		return list;
	}

}
