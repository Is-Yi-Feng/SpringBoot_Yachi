package com.example.demo._02_model.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ship_type")
public class ShipTypeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ship_type_id;
	
	private String type_name;
	
	@OneToMany(mappedBy = "shipTypeBean")
	private List<OrderBean> orderBeans;

	
	public ShipTypeBean() {
		super();
	}
	
	
	public ShipTypeBean(String type_name) {
		super();
		this.type_name = type_name;
	}

	public Integer getShip_type_id() {
		return ship_type_id;
	}

	public void setShip_type_id(Integer ship_type_id) {
		this.ship_type_id = ship_type_id;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public List<OrderBean> getOrderBeans() {
		return orderBeans;
	}

	public void setOrderBeans(List<OrderBean> orderBeans) {
		this.orderBeans = orderBeans;
	}
	
	
	
}
