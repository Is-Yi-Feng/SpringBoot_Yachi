package com.example.demo._20_shoppingMall._23_orderProcess.dao;

import com.example.demo._02_model.entity.OrderStatusBean;

public interface OrderStatusDao {
	OrderStatusBean getStatusById(Integer statusId);
}
