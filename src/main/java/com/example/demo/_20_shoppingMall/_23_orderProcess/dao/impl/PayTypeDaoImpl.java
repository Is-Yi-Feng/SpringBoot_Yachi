package com.example.demo._20_shoppingMall._23_orderProcess.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.PayTypeBean;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.PayTypeDao;

@Repository
public class PayTypeDaoImpl implements PayTypeDao {
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	//取得所有付款種類
	@SuppressWarnings("unchecked")
	@Override
	public List<PayTypeBean> getAllPayTypes() {
		String hql = "From PayTypeBean";
		Session session = factory.getCurrentSession();
		List<PayTypeBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	//依據id找種類
	@Override
	public PayTypeBean getPayTypeById(int payTypeId) {
		Session session = factory.getCurrentSession();
		PayTypeBean payTypeBean = session.get(PayTypeBean.class, payTypeId);
		return payTypeBean;
	}

}
