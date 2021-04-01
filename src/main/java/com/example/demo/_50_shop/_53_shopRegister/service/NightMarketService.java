package com.example.demo._50_shop._53_shopRegister.service;


import java.util.List;

import com.example.demo._02_model.entity.NightMarketBean;




public interface NightMarketService {

	List<NightMarketBean> getAllMarkets();
	
	NightMarketBean getNightMarketById(int nightMarketId);
	
}
