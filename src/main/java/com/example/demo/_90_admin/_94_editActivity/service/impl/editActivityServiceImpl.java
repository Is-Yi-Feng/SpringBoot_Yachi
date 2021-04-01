package com.example.demo._90_admin._94_editActivity.service.impl;

import java.io.Serializable;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._02_model.entity.AdminActivityBean;
import com.example.demo._90_admin._94_editActivity.dao.editActivityDao;
import com.example.demo._90_admin._94_editActivity.service.editActivityService;




@Transactional
@Service
public class editActivityServiceImpl implements editActivityService{
	
	@Autowired
	editActivityDao adminactivitydao;

	@Override
	public AdminActivityBean getAdminActivity(int adminactivity_id) {
		
		return adminactivitydao.getAdminActivity(adminactivity_id);
	}
	
	@Override
	public int saveAdminActivity(AdminActivityBean bean) {
		
		return adminactivitydao.saveAdminActivity(bean);
	}

	@Override
	public List<AdminActivityBean> getAllAdminActivities() {
		
		return adminactivitydao.getAllAdminActivities();
	}

	
	@Override
	public int updateAdminActivity(AdminActivityBean bean) {
		
		return adminactivitydao.updateAdminActivity(bean);
	}
	

	@Override
	public int deleteAdminActivity(int adminactivity_id) {
		
		return adminactivitydao.deleteAdminActivity(adminactivity_id);
	}

	@Override
	public List<AdminActivityBean> getCurrentAdminActivity() {
		List<AdminActivityBean> act = adminactivitydao.getAllAdminActivities();
		List<AdminActivityBean> act2 = new LinkedList<AdminActivityBean>();
		for (AdminActivityBean adminActivityBean : act) {
			Date begin = adminActivityBean.getAdminactivity_begin();
			Date end = adminActivityBean.getAdminactivity_end();
			System.out.println(begin);
			System.out.println(end);
			boolean token = ifTimeOut(begin, end);
			if(token == true) {
				act2.add(adminActivityBean);
			}
		}
		return act2;
	}
	
	
	boolean ifTimeOut(Date begin, Date end) {
		boolean token = true;
		Date now = new Date(new java.util.Date().getTime());
		Integer a = begin.compareTo(now);
		Integer b = end.compareTo(now);
		System.out.println("compare " + a + " and " + b);
	
		 if(a==-1 && b==1){
			 token = true;
		    }else {
		    	token = false;
		    }
		return token;
	}
	
}
