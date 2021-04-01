package com.example.demo._20_shoppingMall._23_orderProcess.service;

import java.util.List;

import com.example.demo._02_model.entity.ShipTypeBean;

public interface ShipTypeService {
	
	//取得所有配送種類
	public List<ShipTypeBean> getAllShipTypes();
	
	//依種類id找種類
	public ShipTypeBean getShipTypeById(int shipTypeId); 
}
