package com.example.demo._20_shoppingMall._23_orderProcess.dao;

import java.util.List;

import com.example.demo._02_model.entity.PayTypeBean;

public interface PayTypeDao {
	//取得所有付款方式
	List<PayTypeBean> getAllPayTypes();
	
	//依據id找種類
	public PayTypeBean getPayTypeById(int payTypeId); 
}
