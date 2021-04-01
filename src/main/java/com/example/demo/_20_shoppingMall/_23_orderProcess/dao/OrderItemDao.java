package com.example.demo._20_shoppingMall._23_orderProcess.dao;

import java.util.List;
import java.util.Set;

import com.example.demo._02_model.entity.OrderItemBean;

public interface OrderItemDao {

	void insertItems(Set<OrderItemBean> orderItems);

	void updateProductStock(OrderItemBean item);

	List<Integer> queryAmountByProductId(Integer id);

}
