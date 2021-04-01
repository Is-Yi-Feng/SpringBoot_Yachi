package com.example.demo._50_shop._53_shopRegister.dao;

import java.util.List;

import com.example.demo._02_model.entity.ShopBean;

public interface ShopDao {

	int saveShop(ShopBean shop);
	
	ShopBean getShop(int shopId);
	
	int updateShop(ShopBean shop);
	
	ShopBean getShopByShopName(String name);
	
	List<ShopBean> getAllShops();
	
	List<ShopBean> getShopsByNightMarket(int marketId);
	
}
