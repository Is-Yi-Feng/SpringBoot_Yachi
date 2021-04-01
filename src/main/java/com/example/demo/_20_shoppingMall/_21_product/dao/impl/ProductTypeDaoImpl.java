package com.example.demo._20_shoppingMall._21_product.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.ProductTypeBean;
import com.example.demo._20_shoppingMall._21_product.dao.ProductTypeDao;

@Repository
public class ProductTypeDaoImpl implements ProductTypeDao {
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	
	//得到所有產品種類id(直接從產品table裡面撈正存在的種類)
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTypeBean> getAllSorts() {
		String hql = "SELECT DISTINCT p.productTypeBean FROM ProductBean p";
		Session session = factory.getCurrentSession();
		List<ProductTypeBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

//	依據typeId取得種類紀錄
	@Override
	public ProductTypeBean getTypeById(int typeId) {
		ProductTypeBean productTypeBean = null;
		Session session = factory.getCurrentSession();
		productTypeBean = session.get(ProductTypeBean.class, typeId);
		return productTypeBean;
	}

	// 取得所有種類
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTypeBean> getSortList() {
		String hql = "From ProductTypeBean";
		Session session = factory.getCurrentSession();
		List<ProductTypeBean> list = session.createQuery(hql).getResultList();
		return list;
	}

}
