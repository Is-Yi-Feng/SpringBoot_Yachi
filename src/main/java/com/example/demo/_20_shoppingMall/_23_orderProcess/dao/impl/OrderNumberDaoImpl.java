package com.example.demo._20_shoppingMall._23_orderProcess.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.OrderNumberBean;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.OrderNumberDao;

@Repository
public class OrderNumberDaoImpl implements OrderNumberDao {
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	@Override
	public OrderNumberBean getNumberById(int id) {
		Session session = factory.getCurrentSession();
		OrderNumberBean orderNumberBean = session.get(OrderNumberBean.class, id);
		return orderNumberBean;
	}

}
