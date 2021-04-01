package com.example.demo._10_member.dao;

import java.util.List;

import com.example.demo._02_model.entity.FavoriteShopListBean;

public interface FavoriteShopDao {

	int saveFavoriteShop(FavoriteShopListBean favoriteShopListBean);
	
	int updateFavoriteShop(FavoriteShopListBean favoriteShopListBean);
	
	List<FavoriteShopListBean> getFavoriteShopByMemberId(Integer memberId);
	
	public void saveFavoriteShop2(Integer memberId,Integer shopBean_id);
	
	List<Integer> getShopIds(int memberId);
	
}
