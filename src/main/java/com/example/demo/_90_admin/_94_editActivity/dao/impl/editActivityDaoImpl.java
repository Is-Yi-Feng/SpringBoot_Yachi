package com.example.demo._90_admin._94_editActivity.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.AdminActivityBean;
import com.example.demo._90_admin._94_editActivity.dao.editActivityDao;



@Repository
public class editActivityDaoImpl implements editActivityDao {
	
	
	@Autowired
	Springboot2Hibernate5 factory;

	@Override
	public AdminActivityBean getAdminActivity(int adminactivity_id) {
		Session session = factory.getCurrentSession();
		AdminActivityBean aab = session.get(AdminActivityBean.class, adminactivity_id);
		return aab;
	}


	@Override
	public int saveAdminActivity(AdminActivityBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(bean);
		n++;
		return n;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<AdminActivityBean> getAllAdminActivities() {
		List<AdminActivityBean> list = null;
		String hql = "FROM AdminActivityBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}



	@Override
	public int updateAdminActivity(AdminActivityBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(bean);
		n++;
		return n;
	}



	@Override
	public int deleteAdminActivity(int adminactivity_id) {
		int n = 0;
		Session session = factory.getCurrentSession();
		AdminActivityBean aab = new AdminActivityBean();
		aab.setAdminactivity_id(adminactivity_id);
		session.delete(aab);
		n++;
		return n;
	}
	
}