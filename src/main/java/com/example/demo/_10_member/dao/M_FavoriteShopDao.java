package com.example.demo._10_member.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.example.demo._02_model.entity.ShopBean;


public interface M_FavoriteShopDao {

	public List<Map<String,Object>> getMyFavoriteShopByMemberId(Integer memberId);
	
	public ShopBean  getShopBy_shop_id(Integer shop_id);
	
	public void deleteSingleFavoriteShopByMemberId(Integer memberId, Integer shop_id );
	
	public Set<ShopBean> getMyFavoriteShopByMemberId2(Integer memberId);
	
}