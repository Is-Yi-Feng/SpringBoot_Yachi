package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.example.demo._10_member.entity.Member;



@Entity
@Table(name = "Coupon_Used")
public class CouponUsedBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer coupon_used_id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_coupon_id")
	private CouponBean couponBean;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_shop_id")
	private ShopBean shopBean;
	
	private Boolean coupon_used_or_not;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_member_id")
	private Member memberBean;
	
	private String coupon_used_memo;
	
	private Timestamp coupon_used_time;

	public Integer getCoupon_used_id() {
		return coupon_used_id;
	}

	public void setCoupon_used_id(Integer coupon_used_id) {
		this.coupon_used_id = coupon_used_id;
	}

	public CouponBean getCouponBean() {
		return couponBean;
	}

	public void setCouponBean(CouponBean couponBean) {
		this.couponBean = couponBean;
	}

	public ShopBean getShopBean() {
		return shopBean;
	}

	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}

	public Boolean getCoupon_used_or_not() {
		return coupon_used_or_not;
	}

	public void setCoupon_used_or_not(Boolean coupon_used_or_not) {
		this.coupon_used_or_not = coupon_used_or_not;
	}

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

	public String getCoupon_used_memo() {
		return coupon_used_memo;
	}

	public void setCoupon_used_memo(String coupon_used_memo) {
		this.coupon_used_memo = coupon_used_memo;
	}

	public Timestamp getCoupon_used_time() {
		return coupon_used_time;
	}

	public void setCoupon_used_time(Timestamp coupon_used_time) {
		this.coupon_used_time = coupon_used_time;
	}
	
	
	
	
}
