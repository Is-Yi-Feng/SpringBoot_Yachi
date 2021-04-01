package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Shop_Type")
public class ShopTypeBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shop_type_id;
	
	private String shop_type_memo;
	
	private String shop_type_name;
	
	// 商家的類型 
	// 雙向多對一 
	// 商家類型一方 商家多方  類型可以有多個商家 一個商家只能有一個類型 
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "shopTypeBean",fetch = FetchType.EAGER)  //告訴外鍵後就不會有中介表格
	private Set<ShopBean> shops = new LinkedHashSet<ShopBean>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "shopTypeBean")  //告訴外鍵後就不會有中介表格
	private Set<CouponBean> coupons = new LinkedHashSet<CouponBean>();
	
	public ShopTypeBean() {
		
	}
	
	public ShopTypeBean(String shop_type_name) {
		super();
		this.shop_type_name = shop_type_name;
	}


	public ShopTypeBean(String shop_type_memo, String shop_type_name, Set<ShopBean> shops) {
		super();
		this.shop_type_memo = shop_type_memo;
		this.shop_type_name = shop_type_name;
		this.shops = shops;
	}
	

	public Integer getShop_type_id() {
		return shop_type_id;
	}

	public void setShop_type_id(Integer shop_type_id) {
		this.shop_type_id = shop_type_id;
	}

	public String getShop_type_memo() {
		return shop_type_memo;
	}

	public void setShop_type_memo(String shop_type_memo) {
		this.shop_type_memo = shop_type_memo;
	}

	public String getShop_type_name() {
		return shop_type_name;
	}

	public void setShop_type_name(String shop_type_name) {
		this.shop_type_name = shop_type_name;
	}

	public Set<ShopBean> getShops() {
		return shops;
	}

	public void setShops(Set<ShopBean> shops) {
		this.shops = shops;
	}

	public Set<CouponBean> getCoupons() {
		return coupons;
	}

	public void setCoupons(Set<CouponBean> coupons) {
		this.coupons = coupons;
	}
	
	
	
	
}
