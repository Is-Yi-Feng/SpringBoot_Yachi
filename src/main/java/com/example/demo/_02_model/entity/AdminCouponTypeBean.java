package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "AdminCoupon_Type")
public class AdminCouponTypeBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer admincoupon_type_id;
	
	private String admincoupon_type_name;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "adminCouponTypeBean")
	private List<AdminCouponBean>  admincoupons = new LinkedList<>();
	
	public AdminCouponTypeBean() {
		super();
	}

	public Integer getAdmincoupon_type_id() {
		return admincoupon_type_id;
	}

	public void setAdmincoupon_type_id(Integer admincoupon_type_id) {
		this.admincoupon_type_id = admincoupon_type_id;
	}

	public String getAdmincoupon_type_name() {
		return admincoupon_type_name;
	}

	public void setAdmincoupon_type_name(String admincoupon_type_name) {
		this.admincoupon_type_name = admincoupon_type_name;
	}

	public List<AdminCouponBean> getAdmincoupons() {
		return admincoupons;
	}

	public void setAdmincoupons(List<AdminCouponBean> admincoupons) {
		this.admincoupons = admincoupons;
	}

	
	

}