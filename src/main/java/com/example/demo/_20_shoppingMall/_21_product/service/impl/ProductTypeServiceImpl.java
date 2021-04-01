package com.example.demo._20_shoppingMall._21_product.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo._02_model.entity.ProductTypeBean;
import com.example.demo._20_shoppingMall._21_product.dao.ProductTypeDao;
import com.example.demo._20_shoppingMall._21_product.service.ProductTypeService;

@Service
public class ProductTypeServiceImpl implements Serializable, ProductTypeService {
	private static final long serialVersionUID = 1L;
	@Autowired
	ProductTypeDao producTypeDao;
	
	@Transactional
	@Override
	public List<ProductTypeBean> getAllSorts() {
		return producTypeDao.getAllSorts();
	}



	@Transactional
	@Override
	public List<ProductTypeBean> getSortList() {
		return producTypeDao.getSortList();
	}

	@Transactional
	@Override
	public ProductTypeBean getTypeById(int typeId) {
		return producTypeDao.getTypeById(typeId);
	}

}
