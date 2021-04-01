package com.example.demo._02_model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="random_number")
public class OrderNumberBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer random_id;
	
	@Column(unique = true)
	private String random_code;
	/**
	 * 本類別對照表格並無外鍵欄位，
	 * 外鍵欄位必須參考對照類別(OrderBean)的orderNumberBean屬性
	 */
//	@OneToOne(mappedBy="orderNumberBean")
//	private OrderBean orderBean;
	
	
	public OrderNumberBean() {
		super();
	}

	public OrderNumberBean(Integer random_id, String random_code) {
		super();
		this.random_id = random_id;
		this.random_code = random_code;
	}

	public Integer getRandom_id() {
		return random_id;
	}


	public void setRandom_id(Integer random_id) {
		this.random_id = random_id;
	}


	public String getRandom_code() {
		return random_code;
	}


	public void setRandom_code(String random_code) {
		this.random_code = random_code;
	}


//	public OrderBean getOrderBean() {
//		return orderBean;
//	}
//
//
//	public void setOrderBean(OrderBean orderBean) {
//		this.orderBean = orderBean;
//	}



}
