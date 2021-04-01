package com.example.demo._90_admin._93_editCoupon.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.AdminCouponBean;
import com.example.demo._02_model.entity.AdminCouponTypeBean;
import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._90_admin._93_editCoupon.dao.editCouponDao;



@Repository
public class editCouponDaoImpl implements editCouponDao {
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	@Override
	public AdminCouponBean getAdminCoupon(int admincouponId) {
		Session session = factory.getCurrentSession();
		AdminCouponBean ac = session.get(AdminCouponBean.class, admincouponId);
		return ac;
	}

	@Override
	public int saveAdminCoupon(AdminCouponBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(bean);
		n++;
		return n;
	}

	@Override
	public List<AdminCouponBean> getAllAdminCoupons() {
		List<AdminCouponBean> list = null;
		String hql = "FROM AdminCouponBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}

//	@Override
//	public List<AdminCouponBean> getShopCoupons(int shopId) {
//		List<AdminCouponBean> list = null;
//        Session session = factory.getCurrentSession();
//        String hql = "FROM AdminCouponBean ac WHERE ac.shopBean.shop_id = :sid";
//        list = session.createQuery(hql)
//        			  .setParameter("sid", shopId)
//        			  .getResultList();
//		return list;
//	}

	@Override
	public int updateAdminCoupon(AdminCouponBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(bean);
		n++;
		return n;
	}

	@Override
	public int deleteAdminCoupon(int admincouponId) {
		int n = 0;
		Session session = factory.getCurrentSession();
		CouponBean ac = new CouponBean();
		ac.setCoupon_id(admincouponId);
		session.delete(ac);
		n++;
		return n;
	}
	
	//得到所有產品種類id(直接從產品table裡面撈正存在的種類)
		@SuppressWarnings("unchecked")
		@Override
		public List<AdminCouponTypeBean> getAllSorts() {
			String hql = "SELECT DISTINCT p.adminCouponTypeBean FROM AdminCouponBean p";
			Session session = factory.getCurrentSession();
			List<AdminCouponTypeBean> list = new ArrayList<>();
			list = session.createQuery(hql).getResultList();
			return list;
		}

//	依據typeId取得種類紀錄
	@Override
	public AdminCouponTypeBean getTypeById(int typeId) {
		AdminCouponTypeBean adminCouponTypeBean = null;
		Session session = factory.getCurrentSession();
		adminCouponTypeBean = session.get(AdminCouponTypeBean.class, typeId);
		return adminCouponTypeBean;
	}
	
	// 取得所有種類
		@SuppressWarnings("unchecked")
		@Override
		public List<AdminCouponTypeBean> getSortList() {
			String hql = "From AdminCouponTypeBean";
			Session session = factory.getCurrentSession();
			List<AdminCouponTypeBean> list = session.createQuery(hql).getResultList();
			return list;
		}


}
