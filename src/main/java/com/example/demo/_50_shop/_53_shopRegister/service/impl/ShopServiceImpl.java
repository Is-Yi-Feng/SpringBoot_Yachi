package com.example.demo._50_shop._53_shopRegister.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._50_shop._53_shopRegister.dao.ShopCommentDao;
import com.example.demo._50_shop._53_shopRegister.dao.ShopDao;
import com.example.demo._50_shop._53_shopRegister.service.ShopService;



@Transactional
@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	ShopDao shopDao;
	
	@Autowired
	ShopCommentDao shopCommentDao;

	@Override
	public int saveShop(ShopBean shop) {
		return shopDao.saveShop(shop);
	}

	@Override
	public ShopBean getShop(int shopId) {
		return shopDao.getShop(shopId);
	}

	@Override
	public int updateShop(ShopBean shop) {
		return shopDao.updateShop(shop);
	}

	@Override
	public ShopBean getShopByShopName(String name) {
		return shopDao.getShopByShopName(name);
	}

	@Override
	public List<ShopBean> getAllShops() {
		return shopDao.getAllShops();
	}

	@Override
	public void setShopScore(int shopId) {
		int n = shopCommentDao.getShopCommentCount(shopId);
		double scores = shopCommentDao.getShopCommentTotalScore(shopId);
		ShopBean shop = shopDao.getShop(shopId);
		shop.setShop_score(scores/n);
		shopDao.updateShop(shop);
	}

	@Override
	public List<ShopBean> getShopsByNightMarket(int marketId) {
		return shopDao.getShopsByNightMarket(marketId);
	}
	
	

}
