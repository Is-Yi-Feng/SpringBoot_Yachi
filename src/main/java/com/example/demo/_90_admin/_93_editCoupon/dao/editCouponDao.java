package com.example.demo._90_admin._93_editCoupon.dao;

import java.util.List;

import com.example.demo._02_model.entity.AdminCouponBean;
import com.example.demo._02_model.entity.AdminCouponTypeBean;



public interface editCouponDao {

	AdminCouponBean getAdminCoupon(int admincoupon_id);
	
	int saveAdminCoupon (AdminCouponBean bean);
	
	List<AdminCouponBean> getAllAdminCoupons();
	
//	List<AdminCouponBean> getShopCoupons(int shopId);
	
	int updateAdminCoupon(AdminCouponBean bean);
	
	int deleteAdminCoupon(int admincoupon_id);
	
	//得所有種類(從產品table撈種類)
	List<AdminCouponTypeBean> getAllSorts();
		
	//依種類id找種類
	public AdminCouponTypeBean getTypeById(int typeId); 
		
	List<AdminCouponTypeBean> getSortList();


}
