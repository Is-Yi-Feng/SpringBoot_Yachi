package com.example.demo._90_admin._93_editCoupon.service;

import java.util.List;

import com.example.demo._02_model.entity.AdminCouponBean;
import com.example.demo._02_model.entity.AdminCouponTypeBean;


public interface editCouponService {
	
	AdminCouponBean getAdminCoupon(int admincouponId);
	
	int saveAdminCoupon (AdminCouponBean bean);
	
	List<AdminCouponBean> getAllAdminCoupons();
	
//	List<AdminCouponBean> getShopCoupons(int shopId);
	
	int updateAdminCoupon(AdminCouponBean bean);
	
	int deleteAdminCoupon(int admincouponId);

	//得所有種類(從產品table撈種類)
	public List<AdminCouponTypeBean> getAllSorts();
		
	//依種類id找種類
	public AdminCouponTypeBean getTypeById(int typeId); 
		
	public List<AdminCouponTypeBean> getSortList();
}
