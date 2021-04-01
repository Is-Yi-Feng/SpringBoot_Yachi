package com.example.demo._20_shoppingMall._21_product.service;

import java.util.List;
import java.util.Map;

import com.example.demo._02_model.entity.ProductBean;


public interface ProductService {
	
	//lab3
	List<ProductBean> getAllProducts();
	
	//更新產品價格(lab4)
	public void updateAllPrice();
	
	//依據種類找產品(lab5)
//	public List<ProductTypeBean> getAllSorts();
	public List<ProductBean> getProductBySort(int sortId);
	
	//查詢單筆產品資料(lab6)
	public ProductBean getProductById(int productId);
	
	//新增產品(lab8)
	public void addProduct(ProductBean product);
//	public ProductTypeBean getSortById(int sortId);
//	public List<ProductTypeBean> getSortList();
	
	//刪除產品
	public void deleteProduct(Integer product_id);
	
	//更新產品
	public void updateProduct(ProductBean productBean);
	
	//產品分頁功能
	Map<Integer, ProductBean> getPageProducts(int pageNo);
	long getRecordCounts();
	int getRecordsPerPage();
	int getTotalPages();
	void setRecordsPerPage(int recordsPerPage);
	void setSelected(String selected);
//	void setPageNo(int pageNo);
//	int getPageNo();

	public void downProduct(Integer product_id);
}
