package com.example.demo._20_shoppingMall._21_product.service;

import java.util.List;

import com.example.demo._02_model.entity.ProductTypeBean;

public interface ProductTypeService {
	
	//得所有種類(從產品table撈種類)
	public List<ProductTypeBean> getAllSorts();
	
	//依種類id找種類
	public ProductTypeBean getTypeById(int typeId); 
	
	public List<ProductTypeBean> getSortList();
}
