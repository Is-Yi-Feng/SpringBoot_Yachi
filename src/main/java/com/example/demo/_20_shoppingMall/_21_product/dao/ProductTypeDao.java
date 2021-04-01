package com.example.demo._20_shoppingMall._21_product.dao;

import java.util.List;

import com.example.demo._02_model.entity.ProductTypeBean;

public interface ProductTypeDao {

	//得所有種類(從產品table撈種類)
	List<ProductTypeBean> getAllSorts();
	
	//依種類id找種類
	public ProductTypeBean getTypeById(int typeId); 
	
	List<ProductTypeBean> getSortList();

}
