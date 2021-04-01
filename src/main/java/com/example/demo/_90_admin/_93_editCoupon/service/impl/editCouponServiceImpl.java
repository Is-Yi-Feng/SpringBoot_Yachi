package com.example.demo._90_admin._93_editCoupon.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._02_model.entity.AdminCouponBean;
import com.example.demo._02_model.entity.AdminCouponTypeBean;
import com.example.demo._90_admin._93_editCoupon.dao.editCouponDao;
import com.example.demo._90_admin._93_editCoupon.service.editCouponService;



@Transactional
@Service
public class editCouponServiceImpl implements editCouponService{
	
	@Autowired
	editCouponDao admincoupondao;

	@Override
	public AdminCouponBean getAdminCoupon(int admincouponId) {
		
		return admincoupondao.getAdminCoupon(admincouponId);
	}

	@Override
	public int saveAdminCoupon(AdminCouponBean bean) {
		
		return admincoupondao.saveAdminCoupon(bean);
	}

	@Override
	public List<AdminCouponBean> getAllAdminCoupons() {
		
		return admincoupondao.getAllAdminCoupons();
	}
	
	
	@Override
	public int updateAdminCoupon(AdminCouponBean bean) {
		
		return admincoupondao.updateAdminCoupon(bean);
	}

	@Override
	public int deleteAdminCoupon(int admincouponId) {
		
		return admincoupondao.deleteAdminCoupon(admincouponId);
	}
	
//	@Transactional
//	@Override
//	public List<AdminCouponBean> getShopCoupons(int shopId) {
//		return admincoupondao.getShopCoupons(shopId);
//	}

	@Override
	public List<AdminCouponTypeBean> getAllSorts() {
		return admincoupondao.getAllSorts();
	}

	@Override
	public AdminCouponTypeBean getTypeById(int typeId) {
		return admincoupondao.getTypeById(typeId);
	}

	@Override
	public List<AdminCouponTypeBean> getSortList() {
		return admincoupondao.getSortList();
	}




	

}
