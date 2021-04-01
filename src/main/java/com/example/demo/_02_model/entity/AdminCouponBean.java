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
@Table(name = "Admin_Coupon")
public class AdminCouponBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer admincoupon_id;
	
	
	
	private Integer admincoupon_amount;
	
	private String admincoupon_info;
	
	private String admincoupon_rule;
	
	private Date admincoupon_end;
	
	private Date admincoupon_begin;
	
	private String admincoupon_name;
	
	private String admincoupon_memo;
	
	private Integer admincoupon_discount;
	
	private Integer admincoupon_consumption;
	
	@Column(columnDefinition = "mediumblob")
	private Blob admincoupon_pic;	
	private String adminfile_name;	
	@Transient
	MultipartFile admincoupon_image;
	
	@JoinColumn(name = "FK_admincoupon_type_id")
	@ManyToOne
	private AdminCouponTypeBean adminCouponTypeBean;

	public Integer getAdmincoupon_id() {
		return admincoupon_id;
	}

	public void setAdmincoupon_id(Integer admincoupon_id) {
		this.admincoupon_id = admincoupon_id;
	}

	public Integer getAdmincoupon_amount() {
		return admincoupon_amount;
	}

	public void setAdmincoupon_amount(Integer admincoupon_amount) {
		this.admincoupon_amount = admincoupon_amount;
	}

	public String getAdmincoupon_info() {
		return admincoupon_info;
	}

	public void setAdmincoupon_info(String admincoupon_info) {
		this.admincoupon_info = admincoupon_info;
	}

	public String getAdmincoupon_rule() {
		return admincoupon_rule;
	}

	public void setAdmincoupon_rule(String admincoupon_rule) {
		this.admincoupon_rule = admincoupon_rule;
	}

	public Date getAdmincoupon_end() {
		return admincoupon_end;
	}

	public void setAdmincoupon_end(Date admincoupon_end) {
		this.admincoupon_end = admincoupon_end;
	}

	public Date getAdmincoupon_begin() {
		return admincoupon_begin;
	}

	public void setAdmincoupon_begin(Date admincoupon_begin) {
		this.admincoupon_begin = admincoupon_begin;
	}

	public String getAdmincoupon_name() {
		return admincoupon_name;
	}

	public void setAdmincoupon_name(String admincoupon_name) {
		this.admincoupon_name = admincoupon_name;
	}

	public String getAdmincoupon_memo() {
		return admincoupon_memo;
	}

	public void setAdmincoupon_memo(String admincoupon_memo) {
		this.admincoupon_memo = admincoupon_memo;
	}

	public Integer getAdmincoupon_discount() {
		return admincoupon_discount;
	}

	public void setAdmincoupon_discount(Integer admincoupon_discount) {
		this.admincoupon_discount = admincoupon_discount;
	}

	public Integer getAdmincoupon_consumption() {
		return admincoupon_consumption;
	}

	public void setAdmincoupon_consumption(Integer admincoupon_consumption) {
		this.admincoupon_consumption = admincoupon_consumption;
	}

	public Blob getAdmincoupon_pic() {
		return admincoupon_pic;
	}

	public void setAdmincoupon_pic(Blob admincoupon_pic) {
		this.admincoupon_pic = admincoupon_pic;
	}

	public String getAdminfile_name() {
		return adminfile_name;
	}

	public void setAdminfile_name(String adminfile_name) {
		this.adminfile_name = adminfile_name;
	}

	public MultipartFile getAdmincoupon_image() {
		return admincoupon_image;
	}

	public void setAdmincoupon_image(MultipartFile admincoupon_image) {
		this.admincoupon_image = admincoupon_image;
	}

	public AdminCouponTypeBean getAdminCouponTypeBean() {
		return adminCouponTypeBean;
	}

	public void setAdminCouponTypeBean(AdminCouponTypeBean adminCouponTypeBean) {
		this.adminCouponTypeBean = adminCouponTypeBean;
	}
	
	

}
	
	
	