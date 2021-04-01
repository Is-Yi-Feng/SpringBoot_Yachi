package com.example.demo._50_shop._53_shopRegister.service;

import java.util.List;

import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._02_model.entity.ShopCommentBean;
import com.example.demo._10_member.entity.Member;

public interface ShopCommentService {
	
	int saveCommentBean(Member member, ShopCommentBean shopCommentBean);
	
	int saveCommentBean(ShopBean shopBean, ShopCommentBean shopCommentBean);
	
	List<ShopCommentBean> getShopCommentByShopId(int shopId);
	
	List<ShopCommentBean> getShopCommentByShopIdAndMemberId(int shopId, int memberId);
	
	int getShopCommentCount(int shopId);

}
