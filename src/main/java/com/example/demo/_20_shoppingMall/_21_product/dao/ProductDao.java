package com.example.demo._20_shoppingMall._21_product.dao;

import java.util.List;
import java.util.Map;

import com.example.demo._02_model.entity.ProductBean;



public interface ProductDao {
	
	//(lab3)
	List<ProductBean> getAllProducts();
	
	//更新產品價格(lab4)
	public void updatePrice(int productId, double newPrice);
	
	//分類查詢產品資料(lab5)
//	List<ProductTypeBean> getAllSorts();
	List<ProductBean> getProductBySort(int sortId);
	
	//查詢單筆產品資料(lab6)
	public ProductBean getProductById(int productId);
	
	//新增一筆產品資料(lab8)
	public void addProduct(ProductBean product);
//	public ProductTypeBean getSortById(int sortId); 
//	List<ProductTypeBean> getSortList();
	
	//刪除產品資料
	public void deleteProduct(Integer product_id);
	
	//更新產品資料
	public void updateProduct(ProductBean productBean);
	
	
	//產品分頁功能
	public Map<Integer, ProductBean> getPageProducts(int pageNo);
	public long getRecordCounts();
	public int getRecordsPerPage();
	public int getTotalPages();
	public void setRecordsPerPage(int recordsPerPage);
	public void setSelected(String selected);
//	void setPageNo(int pageNo);
//	int getPageNo();

	public void downProduct(Integer product_id);
}
