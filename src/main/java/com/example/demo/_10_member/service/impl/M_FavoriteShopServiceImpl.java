package com.example.demo._10_member.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._10_member.dao.M_FavoriteShopDao;
import com.example.demo._10_member.service.M_FavoriteShopService;

@Transactional
@Service
public class M_FavoriteShopServiceImpl implements M_FavoriteShopService {

	@Autowired
	M_FavoriteShopDao m_FavoriteShopDao;
	
	public List<Map<String,Object>> getMyFavoriteShopByMemberId(Integer memberId){
		
		return m_FavoriteShopDao.getMyFavoriteShopByMemberId(memberId);
	}
	
	public ShopBean  getShopBy_shop_id(Integer shop_id){
		return m_FavoriteShopDao.getShopBy_shop_id(shop_id);
	}

	@Override
	public void deleteSingleFavoriteShopByMemberId(Integer memberId, Integer shop_id ) {
		m_FavoriteShopDao.deleteSingleFavoriteShopByMemberId(memberId, shop_id);
	}
	
	@Override
	public Set<ShopBean> getMyFavoriteShopByMemberId2(Integer memberId){
		return m_FavoriteShopDao.getMyFavoriteShopByMemberId2(memberId);
	}
}