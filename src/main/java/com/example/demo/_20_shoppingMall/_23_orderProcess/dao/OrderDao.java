package com.example.demo._20_shoppingMall._23_orderProcess.dao;

import java.util.List;

import com.example.demo._02_model.entity.OrderBean;

public interface OrderDao {

	void insertOrder(OrderBean orderBean);

	List<OrderBean> getAllOrdersByMemberId(Integer memberId);

	OrderBean getOrderById(Integer orderNo);

	void updateOrderNumberById(Integer order_id);

	void updateOrderStatus(OrderBean orderBean);

	OrderBean queryOrder(String orderNumber);

	String getOrderNumber(Integer order_id);




}
