package com.example.demo._02_model.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "Order_Item")
public class OrderItemBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer order_item_id;
	
	@ManyToOne
	@JoinColumn(name="FK_order_id")
	@JsonIgnoreProperties("items")
	private OrderBean orderBean;  //fk
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_product_id")
	private ProductBean productBean;
	
	private Double unitPrice;
	
	private Integer amount;
	
	private Double discount;
	
	private String order_memo;

	
	
	
	
	
	public Integer getOrder_item_id() {
		return order_item_id;
	}

	public void setOrder_item_id(Integer order_item_id) {
		this.order_item_id = order_item_id;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public String getOrder_memo() {
		return order_memo;
	}

	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}

	public OrderItemBean(Integer order_item_id, OrderBean orderBean, ProductBean productBean, Double unitPrice,
			Integer amount, Double discount, String order_memo) {
		super();
		this.order_item_id = order_item_id;
		this.orderBean = orderBean;
		this.productBean = productBean;
		this.unitPrice = unitPrice;
		this.amount = amount;
		this.discount = discount;
		this.order_memo = order_memo;
	}

	public OrderItemBean() {
		super();
	}
	
	
	
}
