package com.example.demo._02_model.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.example.demo._10_member.entity.Member;


@Entity
@Table(name = "Cart")
public class CartBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/** 此表更改欄位
	 * cart_id
	 * member_id
	 * product_id
	 * total
	 * amount
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cart_id; 
	
//	一對多(購物車 : 購物車明細)
//	@OneToMany(cascade=CascadeType.ALL, mappedBy = "cartBean")
//	private Set<CartItemBean> itemBeans = new LinkedHashSet<CartItemBean>();
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_member_id")
	private Member memberBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_product_id")
	private ProductBean productBean;
	
//	private Integer cart_status;  //用數字表示購物車存在狀況

	/**
	 * 購物車中所有商品的總金額
	 * 如果不在此計算，則每次可能需要用到都要算一次
	 */
	private Double cart_total;
	
//	購物車中商品的數量
	private Integer cart_amount;

	public Integer getCart_id() {
		return cart_id;
	}

	public void setCart_id(Integer cart_id) {
		this.cart_id = cart_id;
	}

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}

	
	public Double getCart_total() {
//		數量*價格
		Double price = productBean.getProduct_price();
		Integer amount = this.cart_amount;
		this.cart_total = price * amount;
		return this.cart_total;
	}

	public void setCart_total(Double cart_total) {
		this.cart_total = cart_total;
	}

	public Integer getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(Integer cart_amount) {
		this.cart_amount = cart_amount;
	}
	
	
	
}
