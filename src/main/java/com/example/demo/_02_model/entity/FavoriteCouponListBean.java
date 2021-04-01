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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.example.demo._10_member.entity.Member;



@Entity
@Table(name = "Favorite_CouponList")
public class FavoriteCouponListBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer coupon_list_id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_member_id")
	private Member memberBean;
	
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinTable(
			name = "Coupon_CouponList",  //這個才有外鍵
			joinColumns = {
				@JoinColumn(name = "FK_couponlist_id",referencedColumnName = "coupon_list_id")
			},inverseJoinColumns = {
				@JoinColumn(name = "FK_coupon_id")
			}
			)
	private Set<CouponBean> coupons = new LinkedHashSet<CouponBean>();

	
	
	
	
	public Integer getCoupon_list_id() {
		return coupon_list_id;
	}

	public void setCoupon_list_id(Integer coupon_list_id) {
		this.coupon_list_id = coupon_list_id;
	}

	

	public Set<CouponBean> getCoupons() {
		return coupons;
	}

	public void setCoupons(Set<CouponBean> coupons) {
		this.coupons = coupons;
	}


	public FavoriteCouponListBean() {
		super();
	}

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

	public FavoriteCouponListBean(Integer coupon_list_id, Member memberBean, Set<CouponBean> coupons) {
		super();
		this.coupon_list_id = coupon_list_id;
		this.memberBean = memberBean;
		this.coupons = coupons;
	}

	
	
	
}
