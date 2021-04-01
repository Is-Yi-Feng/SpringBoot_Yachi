package com.example.demo._20_shoppingMall._23_orderProcess.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo._02_model.entity.ShipTypeBean;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.ShipTypeDao;
import com.example.demo._20_shoppingMall._23_orderProcess.service.ShipTypeService;

@Service
public class ShipTypeServiceImpl implements ShipTypeService {
	@Autowired
	ShipTypeDao shipTypeDao;
	
	@Transactional
	@Override
	public List<ShipTypeBean> getAllShipTypes() {
		return shipTypeDao.getAllShipTypes();
	}

	@Override
	public ShipTypeBean getShipTypeById(int shipTypeId) {
		return shipTypeDao.getShipTypeById(shipTypeId);
	}

}
