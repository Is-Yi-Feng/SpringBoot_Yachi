package com.example.demo._90_admin._94_editActivity.dao;

import java.util.List;

import com.example.demo._02_model.entity.AdminActivityBean;



public interface editActivityDao {

	AdminActivityBean getAdminActivity(int adminactivity_id);
	
	int saveAdminActivity (AdminActivityBean bean);
	
	List<AdminActivityBean> getAllAdminActivities();
	
	int updateAdminActivity(AdminActivityBean bean);
	
	int deleteAdminActivity(int adminactivity_id);

}
