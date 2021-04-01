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
@Table(name = "NightMarket")
public class NightMarketBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer market_id;
	
	
	private String market_name;
	
	private Double market_score;
	
	private String market_comment;
	
	private String market_memo;
	
	private String marketURL;
	
	
	
	// 雙向多對一 
	// 夜市一方 商家多方  夜市可以有多個商家 一個商家只能有一個夜市 
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "nightMarketBean",fetch = FetchType.EAGER)  //告訴外鍵後就不會有中介表格
	private Set<ShopBean> shops = new LinkedHashSet<ShopBean>();
	
	
	public NightMarketBean() {
		
	}

	public NightMarketBean(String market_name, Double market_score, String market_comment, String market_memo,
			Set<ShopBean> shops) {
		super();
		this.market_name = market_name;
		this.market_score = market_score;
		this.market_comment = market_comment;
		this.market_memo = market_memo;
		this.shops = shops;
	}
	public NightMarketBean(String market_name, Double market_score) {
		super();
		this.market_name = market_name;
		this.market_score = market_score;
		
	}

	public Integer getMarket_id() {
		return market_id;
	}

	public void setMarket_id(Integer market_id) {
		this.market_id = market_id;
	}

	public String getMarket_name() {
		return market_name;
	}

	public void setMarket_name(String market_name) {
		this.market_name = market_name;
	}

	public Double getMarket_score() {
		return market_score;
	}

	public void setMarket_score(Double market_score) {
		this.market_score = market_score;
	}

	public String getMarket_comment() {
		return market_comment;
	}

	public void setMarket_comment(String market_comment) {
		this.market_comment = market_comment;
	}

	public String getMarket_memo() {
		return market_memo;
	}

	public void setMarket_memo(String market_memo) {
		this.market_memo = market_memo;
	}

	public Set<ShopBean> getShops() {
		return shops;
	}

	public void setShops(Set<ShopBean> shops) {
		this.shops = shops;
	}
	
	public String getMarketURL() {
		return marketURL;
	}

	public void setMarketURL(String marketURL) {
		this.marketURL = marketURL;
	}

	
}
