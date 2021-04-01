package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.sql.Timestamp;
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
@Table(name = "Favorite_ShopList")
public class FavoriteShopListBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shop_list_id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_member_id")
	private Member memberBean;
	
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinTable(
			name = "Shop_ShopList",  //這個才有外鍵
			joinColumns = {
				@JoinColumn(name = "FK_ShopList_id",referencedColumnName = "shop_list_id")
			},inverseJoinColumns = {
				@JoinColumn(name = "FK_Shop_id")
			}
			)
	private Set<ShopBean> shops = new LinkedHashSet<ShopBean>();
	
	private Timestamp subscribe_time;

	public Integer getShop_list_id() {
		return shop_list_id;
	}

	public void setShop_list_id(Integer shop_list_id) {
		this.shop_list_id = shop_list_id;
	}

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

	

	public Set<ShopBean> getShops() {
		return shops;
	}

	public void setShops(Set<ShopBean> shops) {
		this.shops = shops;
	}

	public Timestamp getSubscribe_time() {
		return subscribe_time;
	}

	public void setSubscribe_time(Timestamp subscribe_time) {
		this.subscribe_time = subscribe_time;
	}

	public FavoriteShopListBean(Integer shop_list_id, Member memberBean, Set<ShopBean> shops,
			Timestamp subscribe_time) {
		super();
		this.shop_list_id = shop_list_id;
		this.memberBean = memberBean;
		this.shops = shops;
		this.subscribe_time = subscribe_time;
	}

	public FavoriteShopListBean() {
		super();
	}
	
	
	
	
}
