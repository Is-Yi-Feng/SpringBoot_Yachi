package com.example.demo._20_shoppingMall._22_shoppingCart.vo;

import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


public class SessionCartVo {

	private Integer product_id;
	private String product_name;
	private Double product_price;
	private Integer product_stock;
	private String product_info;
	private Blob product_pic;
	private Date product_expire;
	private String filename;
    private String product_spec;
    private Integer scQty;
    private Double cart_total;
    
	public SessionCartVo() {
		super();
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public Double getProduct_price() {
		return product_price;
	}

	public void setProduct_price(Double product_price) {
		this.product_price = product_price;
	}

	public Integer getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(Integer product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public Blob getProduct_pic() {
		return product_pic;
	}

	public void setProduct_pic(Blob product_pic) {
		this.product_pic = product_pic;
	}

	public Date getProduct_expire() {
		return product_expire;
	}

	public void setProduct_expire(Date product_expire) {
		this.product_expire = product_expire;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getProduct_spec() {
		return product_spec;
	}

	public void setProduct_spec(String product_spec) {
		this.product_spec = product_spec;
	}

	public Integer getScQty() {
		return scQty;
	}

	public void setScQty(Integer scQty) {
		this.scQty = scQty;
	}

	public Double getCart_total() {
//		數量*價格
		this.cart_total = product_price * scQty;
		
		return this.cart_total;
	}

	public void setCart_total(Double cart_total) {
		this.cart_total = cart_total;
	}
    
    

}
