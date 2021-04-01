package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.sql.Blob;
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
@Table(name = "Shop_Comment")
public class ShopCommentBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shop_comment_id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_shop_id")
	private ShopBean shopBean;
	
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_member_id")
	private Member memberBean;
	
	private Timestamp shop_comment_time;
	
	private Double shop_score;
	
	private String shop_comment_content;
	
	private Blob shop_cmment_photo;
	
	private String shop_comment_memo;
	
	private String shop_response;

	public Integer getShop_comment_id() {
		return shop_comment_id;
	}

	public void setShop_comment_id(Integer shop_comment_id) {
		this.shop_comment_id = shop_comment_id;
	}

	public ShopBean getShopBean() {
		return shopBean;
	}

	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

	public Timestamp getShop_comment_time() {
		return shop_comment_time;
	}

	public void setShop_comment_time(Timestamp shop_comment_time) {
		this.shop_comment_time = shop_comment_time;
	}

	public Double getShop_score() {
		return shop_score;
	}

	public void setShop_score(Double shop_score) {
		this.shop_score = shop_score;
	}

	public String getShop_comment_content() {
		return shop_comment_content;
	}

	public void setShop_comment_content(String shop_comment_content) {
		this.shop_comment_content = shop_comment_content;
	}

	public Blob getShop_cmment_photo() {
		return shop_cmment_photo;
	}

	public void setShop_cmment_photo(Blob shop_cmment_photo) {
		this.shop_cmment_photo = shop_cmment_photo;
	}

	public String getShop_comment_memo() {
		return shop_comment_memo;
	}

	public void setShop_comment_memo(String shop_comment_memo) {
		this.shop_comment_memo = shop_comment_memo;
	}

	public String getShop_response() {
		return shop_response;
	}

	public void setShop_response(String shop_response) {
		this.shop_response = shop_response;
	}
	
	
	
}
