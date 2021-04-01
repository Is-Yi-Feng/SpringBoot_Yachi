package com.example.demo._50_shop._53_shopRegister.service.impl;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._02_model.entity.ShopCommentBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._50_shop._53_shopRegister.dao.ShopCommentDao;
import com.example.demo._50_shop._53_shopRegister.service.ShopCommentService;

@Transactional
@Service
public class ShopCommentServiceImpl implements ShopCommentService{

	@Autowired
	ShopCommentDao shopCommentDao;
	
	@Override
	public int saveCommentBean(Member member, ShopCommentBean shopCommentBean) {
		int n = 0;
		
			shopCommentBean.setMemberBean(member);
			Timestamp registerTime = new Timestamp(System.currentTimeMillis());
			shopCommentBean.setShop_comment_time(registerTime);
			shopCommentDao.saveShopComment(shopCommentBean);
			n++;	
		
		return n;
	}

	@Override
	public int saveCommentBean(ShopBean shopBean, ShopCommentBean shopCommentBean) {
		int n = 0;
		ShopCommentBean temp = shopCommentDao.getShopCommentByCommentId(shopCommentBean.getShop_comment_id());
		temp.setShop_response(shopCommentBean.getShop_response());
		shopCommentDao.updateShopComment(temp);
		n++;
		return n;
	}

	@Override
	public List<ShopCommentBean> getShopCommentByShopId(int shopId) {
		return shopCommentDao.getShopCommentByShopId(shopId);
	}

	@Override
	public List<ShopCommentBean> getShopCommentByShopIdAndMemberId(int shopId, int memberId) {
		return shopCommentDao.getShopCommentByShopIdAndMemberId(shopId, memberId);
	}

	@Override
	public int getShopCommentCount(int shopId) {
		return shopCommentDao.getShopCommentCount(shopId);
	}
	

}
