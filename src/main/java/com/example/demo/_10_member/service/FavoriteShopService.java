package com.example.demo._10_member.service;

import java.util.List;

import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._10_member.entity.Member;

public interface FavoriteShopService {
	
	int saveFavoriteShop(ShopBean shopBean , Member member);
	
	public void saveFavoriteShop2(Integer memberId, Integer shopBean_id) ;
	
	List<Integer> getShopIds(int memberId);

}
