package com.example.demo._20_shoppingMall._23_orderProcess.dao;

import java.util.List;

import com.example.demo._02_model.entity.ShipTypeBean;

public interface ShipTypeDao {
	//得到所有配送種類
	List<ShipTypeBean> getAllShipTypes();
	
	//依種類id找種類
	public ShipTypeBean getShipTypeById(int shipTypeId); 
}
