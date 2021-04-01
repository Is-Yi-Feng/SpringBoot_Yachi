package com.example.demo._50_shop._53_shopRegister.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._02_model.entity.NightMarketBean;
import com.example.demo._50_shop._53_shopRegister.dao.NightMarketDao;
import com.example.demo._50_shop._53_shopRegister.service.NightMarketService;


@Transactional
@Service
public class NightMarketServiceImpl implements NightMarketService{

	@Autowired
	NightMarketDao nightMarketDao;
	
	@Override
	public List<NightMarketBean> getAllMarkets() {
		
		return nightMarketDao.getAllMarkets();
	}

	@Override
	public NightMarketBean getNightMarketById(int nightMarketId) {
		
		return nightMarketDao.getNightMarketById(nightMarketId);
	}
	

}
