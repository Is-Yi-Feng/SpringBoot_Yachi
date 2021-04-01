package com.example.demo._50_shop._53_shopRegister.dao;

import java.util.List;

import com.example.demo._02_model.entity.NightMarketBean;



public interface NightMarketDao {
	
	List<NightMarketBean> getAllMarkets();
	
	public NightMarketBean getNightMarketById(int nightMarketId);

}
