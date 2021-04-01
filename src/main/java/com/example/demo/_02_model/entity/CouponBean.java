package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Coupon")
public class CouponBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer coupon_id;
	
	
	
	private Integer coupon_amount;
	
	private String coupon_info;
	
	private String coupon_rule;
	
	private Date coupon_begin;
	
	private Date coupon_end;
	
	private String coupon_name;
	
	private String coupon_memo;
	
	
	@Column(columnDefinition = "mediumblob")
	private Blob coupon_pic;	
	private String file_name;	
	@Transient
	MultipartFile coupon_image;

	@ManyToOne
	@JoinColumn(name = "FK_shop_id")
	private ShopBean shopBean;

	
	
	@ManyToOne
	@JoinColumn(name = "FK_shop_type_id")
	private ShopTypeBean shopTypeBean;
	
	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "coupons")
	private Set<FavoriteCouponListBean> couponlist = new LinkedHashSet<FavoriteCouponListBean>();
	
	
	



	public CouponBean(Integer coupon_id, Integer coupon_amount, String coupon_info, String coupon_rule,
			Date coupon_begin, Date coupon_end, String coupon_name, String coupon_memo, ShopBean shopBean) {
		super();
		this.coupon_id = coupon_id;
		this.coupon_amount = coupon_amount;
		this.coupon_info = coupon_info;
		this.coupon_rule = coupon_rule;
		this.coupon_begin = coupon_begin;
		this.coupon_end = coupon_end;
		this.coupon_name = coupon_name;
		this.coupon_memo = coupon_memo;
		this.shopBean = shopBean;
	}



	public Integer getCoupon_id() {
		return coupon_id;
	}
	
	

	public void setCoupon_id(Integer coupon_id) {
		this.coupon_id = coupon_id;
	}

	

	public Integer getCoupon_amount() {
		return coupon_amount;
	}

	public void setCoupon_amount(Integer coupon_amount) {
		this.coupon_amount = coupon_amount;
	}

	public String getCoupon_info() {
		return coupon_info;
	}

	public void setCoupon_info(String coupon_info) {
		this.coupon_info = coupon_info;
	}

	public String getCoupon_rule() {
		return coupon_rule;
	}

	public void setCoupon_rule(String coupon_rule) {
		this.coupon_rule = coupon_rule;
	}

	

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public String getCoupon_memo() {
		return coupon_memo;
	}

	public void setCoupon_memo(String coupon_memo) {
		this.coupon_memo = coupon_memo;
	}
	
	

	public ShopBean getShopBean() {
		return shopBean;
	}



	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}

	
	

	
	

	public Set<FavoriteCouponListBean> getCouponlist() {
		return couponlist;
	}



	public void setCouponlist(Set<FavoriteCouponListBean> couponlist) {
		this.couponlist = couponlist;
	}



	



	public CouponBean() {
		super();
	}


	
	



	



	public Date getCoupon_end() {
		return coupon_end;
	}



	public void setCoupon_end(Date coupon_end) {
		this.coupon_end = coupon_end;
	}



	public Date getCoupon_begin() {
		return coupon_begin;
	}



	public void setCoupon_begin(Date coupon_begin) {
		this.coupon_begin = coupon_begin;
	}



	public Blob getCoupon_pic() {
		return coupon_pic;
	}



	public void setCoupon_pic(Blob coupon_pic) {
		this.coupon_pic = coupon_pic;
	}



	public String getFile_name() {
		return file_name;
	}



	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}



	public MultipartFile getCoupon_image() {
		return coupon_image;
	}



	public void setCoupon_image(MultipartFile coupon_image) {
		this.coupon_image = coupon_image;
	}



	public ShopTypeBean getShopTypeBean() {
		return shopTypeBean;
	}



	public void setShopTypeBean(ShopTypeBean shopTypeBean) {
		this.shopTypeBean = shopTypeBean;
	}
	
	
	
	
	
}
