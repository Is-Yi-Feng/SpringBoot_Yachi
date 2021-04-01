package com.example.demo._50_shop._52_shopmenu.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._02_model.entity.ShopMenuBean;
import com.example.demo._50_shop._52_shopmenu.dao.ShopMenuDao;
import com.example.demo._50_shop._52_shopmenu.service.ShopMenuService;

@Transactional
@Service
public class ShopMenuServiceImpl implements ShopMenuService{
	
	@Autowired
	ShopMenuDao shopmenudao;

	
	@Override
	public ShopMenuBean getMenu(int menu_id) {
		
		return shopmenudao.getMenu(menu_id);
	}

	@Override
	public int saveMenu(ShopMenuBean bean) {
		
		return shopmenudao.saveMenu(bean);
	}

	@Override
	public List<ShopMenuBean> getAllMenu() {
		
		return shopmenudao.getAllMenu();
	}
	
	@Override
	public List<ShopMenuBean> getShopMenu(int shopId) {
		
		return shopmenudao.getShopMenu(shopId);
	}
	
	@Override
	public int updateMenu(ShopMenuBean bean) {
		
		return shopmenudao.updateMenu(bean);
	}

	@Override
	public int deleteMenu(int menu_id) {
		
		return shopmenudao.deleteMenu(menu_id);
	}
	
	

}
