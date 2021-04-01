package com.example.demo._50_shop._52_shopmenu.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.ShopMenuBean;
import com.example.demo._50_shop._52_shopmenu.dao.ShopMenuDao;

@Repository
public class ShopMenuDaoImpl implements ShopMenuDao{

	@Autowired
	Springboot2Hibernate5 factory;

	@Override
	public ShopMenuBean getMenu(int menu_id) {
		Session session = factory.getCurrentSession();
		ShopMenuBean smb = session.get(ShopMenuBean.class, menu_id);
		return smb;
	}
	
//  回傳存檔動作，以計數器做
	@Override
	public int saveMenu(ShopMenuBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(bean);
		n++;
		return n;
	}
	
//	撈出所有menu資料
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopMenuBean> getAllMenu() {
		List<ShopMenuBean> list = null;
		String hql = "FROM ShopMenuBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}
	
//	撈出所有符合shopid的menu資料
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopMenuBean> getShopMenu(int shopId) {
		List<ShopMenuBean> list = null;
        Session session = factory.getCurrentSession();
        String hql = "FROM ShopMenuBean smb WHERE smb.shopBean.shop_id = :sid";
        list = session.createQuery(hql)
        			  .setParameter("sid", shopId)
        			  .getResultList();
		return list;
	}
	
//	更新所有menu資料
	@Override
	public int updateMenu(ShopMenuBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(bean);
		n++;
		return n;
	}
	
//	刪除menu資料並以計數器回傳
	@Override
	public int deleteMenu(int menu_id) {
		int n = 0;
		Session session = factory.getCurrentSession();
		ShopMenuBean smb = new ShopMenuBean();
		smb.setMenu_id(menu_id);
		session.delete(smb);
		n++;
		return n;
	}

	

}
