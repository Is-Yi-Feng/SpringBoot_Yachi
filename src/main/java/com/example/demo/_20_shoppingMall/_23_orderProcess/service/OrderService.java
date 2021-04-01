package com.example.demo._20_shoppingMall._23_orderProcess.service;

import java.util.List;

import com.example.demo._02_model.entity.OrderBean;

public interface OrderService {

	OrderBean createOrder(OrderBean orderBean);

	List<OrderBean> getAllOrdersByMemberId(Integer memberId);

	OrderBean getOrderById(Integer orderNo);

	public void checkStock(OrderBean orderBean);

	void cancelOrder(OrderBean orderBean);

	OrderBean queryOrder(String orderNumber);
}
