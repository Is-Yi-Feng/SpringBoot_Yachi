package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "order_status")
public class OrderStatusBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer status_id;
	
	private String status_name;
	
	@OneToMany(mappedBy = "orderStatusBean")
	private List<OrderBean> orderBeans;

	public OrderStatusBean() {
		super();
	}
	
	public OrderStatusBean(String status_name) {

		this.status_name = status_name;
	}

	public Integer getStatus_id() {
		return status_id;
	}

	public void setStatus_id(Integer status_id) {
		this.status_id = status_id;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public List<OrderBean> getOrderBeans() {
		return orderBeans;
	}

	public void setOrderBeans(List<OrderBean> orderBeans) {
		this.orderBeans = orderBeans;
	}
	
	
}
