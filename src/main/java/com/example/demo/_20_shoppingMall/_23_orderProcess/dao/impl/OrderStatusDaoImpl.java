package com.example.demo._20_shoppingMall._23_orderProcess.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.OrderStatusBean;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.OrderStatusDao;
@Repository
public class OrderStatusDaoImpl implements OrderStatusDao {
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	@Override
	public OrderStatusBean getStatusById(Integer statusId) {
		Session sesison = factory.getCurrentSession();
		OrderStatusBean statusBean = sesison.get(OrderStatusBean.class, statusId);
		return statusBean;
	}

}
