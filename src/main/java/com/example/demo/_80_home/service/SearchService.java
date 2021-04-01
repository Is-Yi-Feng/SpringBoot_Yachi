package com.example.demo._80_home.service;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.NightMarketBean;
import com.example.demo._02_model.entity.ProductBean;
import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._80_home.dao.SearchDao;

@Transactional
@Service
public class SearchService {
	
	@Autowired
	SearchDao searchDao;
	
	public List<NightMarketBean> searchNight(String market_name){
		return searchDao.searchNight(market_name);
	}
	
	public List<CouponBean> getAllCouponNoExpired(String coupon_name) {
		return searchDao.getAllCouponNoExpired(coupon_name);
	}
	
	public List<ProductBean> getALLProducts(){
		return searchDao.getALLProducts();
	}
	
	public List<ProductBean> getAllProductsByName(String product_name) {
		return searchDao.getAllProductsByName(product_name);
	}

	public List<ProductBean>  getAllProductsByHighPrice(String product_name) {
		return searchDao.getAllProductsByHighPrice(product_name);
	}

	public List<ProductBean> getAllProductsByLowPrice(String product_name) {
		return searchDao.getAllProductsByLowPrice(product_name);
	}

	public List<ProductBean> getAllProductsByBetweenPrice(String product_name,Double lowPrice,Double highPrice) {
		return searchDao.getAllProductsByBetweenPrice(product_name,lowPrice, highPrice);
	}
	
	public List<ProductBean> getReleaseNewProduct() {
		return searchDao.getReleaseNewProduct();
	}

	public Set<ProductBean> getProductTypeBean(Integer product_type_id) {
		return searchDao.getProductTypeBean(product_type_id);
	}
	
	public List<ShopBean> getAllShopByName(String shop_name) {
		return searchDao.getAllShopByName(shop_name);
	}

	public Set<ShopBean> getAllShopBean(Integer shop_type_id) {
		return searchDao.getAllShopBean(shop_type_id);
	}

	public List<ProductBean> getALLProductsByLow() {
		return searchDao.getALLProductsByLow();
	}

	public List<ProductBean> getALLProductsByHigh() {
		return searchDao.getALLProductsByHigh();
	}
	
	public List<ProductBean> getALLProductsBet(Double lowPrice,Double highPrice) {
		return searchDao.getALLProductsBet(lowPrice, highPrice);
	}


}
