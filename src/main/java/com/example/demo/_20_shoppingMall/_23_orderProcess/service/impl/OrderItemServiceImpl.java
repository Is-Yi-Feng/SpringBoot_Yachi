package com.example.demo._20_shoppingMall._23_orderProcess.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo._20_shoppingMall._23_orderProcess.dao.OrderItemDao;
import com.example.demo._20_shoppingMall._23_orderProcess.service.OrderItemService;

@Transactional
@Service
public class OrderItemServiceImpl implements OrderItemService {
	@Autowired
	OrderItemDao orderItemDao;
	
	@Override
	public Integer getSoldQty(Integer id) {
		Integer sum = 0;
		List<Integer> amountList = orderItemDao.queryAmountByProductId(id);
		if(amountList != null) {
			for(Integer amount : amountList) {
				sum += amount;  //將資料庫取出來的多筆(數量)一筆一筆加到sum裡面
			}
		}
		return sum;
	}

}
