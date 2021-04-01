package com.example.demo._20_shoppingMall._23_orderProcess.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.OrderBean;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.OrderDao;


@Repository
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	//新建訂單紀錄
	@Override
	public void insertOrder(OrderBean orderBean) {
		Session session = factory.getCurrentSession();
		session.save(orderBean);
	}

	//取得會員所有訂單
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getAllOrdersByMemberId(Integer memberId) {
		Session session = factory.getCurrentSession();
		String hql = " FROM OrderBean o "
				   + " WHERE o.memberBean.memberId = :memberId ";
		List<OrderBean> orders =  session.createQuery(hql)
										 .setParameter("memberId", memberId)
										 .getResultList();
		return orders;
	}

	@Override
	public OrderBean getOrderById(Integer orderNo) {
		Session session = factory.getCurrentSession();
		OrderBean orderBean = session.get(OrderBean.class, orderNo);
		return orderBean;
	}

	//從號表格取得訂單號碼
	@Override
	public void updateOrderNumberById(Integer order_id) {
		Session session = factory.getCurrentSession();
		String hqlSelect = " SELECT o.random_code "
				   + " FROM OrderNumberBean o "
				   + " WHERE o.random_id = :order_id ";
		String hqlUpdate = " UPDATE OrderBean o "
						 + " SET o.orderNumber = :orderNumber"
						 + " WHERE o.order_id = :order_id";
		//依據訂單id 取得訂單號
		String orderCode = (String) session.createQuery(hqlSelect)
										   .setParameter("order_id", order_id)
										   .getSingleResult();
		//加入有序訂單號欄位
		session.createQuery(hqlUpdate)
			   .setParameter("orderNumber", orderCode)
			   .setParameter("order_id", order_id)
			   .executeUpdate();
	
	}
	
	//依據訂單自增的id找訂單編號
	@Override
	public String getOrderNumber(Integer order_id) {
		Session session = factory.getCurrentSession();
		String hqlSelect = " SELECT o.random_code "
				   + " FROM OrderNumberBean o "
				   + " WHERE o.random_id = :order_id ";
		String orderCode = (String) session.createQuery(hqlSelect)
				   .setParameter("order_id", order_id)
				   .getSingleResult();
		return orderCode;
	}
	
	//取消訂單
	@Override
	public void updateOrderStatus(OrderBean orderBean) {
		if(orderBean.getOrderStatusBean() != null && orderBean.getOrder_id() != null) {
			Session session = factory.getCurrentSession();
			session.saveOrUpdate(orderBean);
		}
	}

	@Override
	public OrderBean queryOrder(String orderNumber) {
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean WHERE orderNumber = :orderNumber";
		@SuppressWarnings("unchecked")
		List<OrderBean> orders = session.createQuery(hql)
										.setParameter("orderNumber", orderNumber)
										.getResultList();
		if(orders == null || orders.isEmpty()) {
			return null;
		}
		return orders.get(0);
	}

	


}
