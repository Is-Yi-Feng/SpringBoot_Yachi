package com.example.demo._50_shop._53_shopRegister.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.NightMarketBean;
import com.example.demo._50_shop._53_shopRegister.dao.NightMarketDao;



@Repository
public class NightMarketDaoImpl implements NightMarketDao{
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<NightMarketBean> getAllMarkets() {
		String hql = "FROM NightMarketBean";
		Session session = factory.getCurrentSession();
		List<NightMarketBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public NightMarketBean getNightMarketById(int nightMarketId) {
		Session session = factory.getCurrentSession();
		NightMarketBean nightMarketBean = session.get(NightMarketBean.class, nightMarketId);
		return nightMarketBean;
	}

}
