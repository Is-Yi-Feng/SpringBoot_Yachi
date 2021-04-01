package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "pay_type")
public class PayTypeBean  implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pay_type_id;
	
	private String pay_type_name;
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "payTypeBean")
	private List<OrderBean> orderBeans = new LinkedList<>();

	public PayTypeBean() {
		super();
	}

	public PayTypeBean(String pay_type_name) {

		this.pay_type_name = pay_type_name;
	}

	public Integer getPay_type_id() {
		return pay_type_id;
	}

	public void setPay_type_id(Integer pay_type_id) {
		this.pay_type_id = pay_type_id;
	}

	public String getPay_type_name() {
		return pay_type_name;
	}

	public void setPay_type_name(String pay_type_name) {
		this.pay_type_name = pay_type_name;
	}

	public List<OrderBean> getOrderBeans() {
		return orderBeans;
	}

	public void setOrderBeans(List<OrderBean> orderBeans) {
		this.orderBeans = orderBeans;
	}
	
	
}
