package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.example.demo._10_member.entity.Member;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;



@Entity
@Table(name = "Orders")
public class OrderBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer order_id;
	
//	@OneToOne(cascade = CascadeType.PERSIST)
//	@JoinColumn(name = "FK_orderNumber")
//	private OrderNumberBean orderNumberBean; //fk 一對一(唯一性)
	
	@Column(unique = true)
	private String orderNumber; //有序訂單號(唯一性，無關連其他表格)
	
	@ManyToOne
	@JoinColumn(name="FK_member_id")
	private Member memberBean;  //fk member 多對一
	
	private String order_address;
	
	//預設 lazyLoding 需要加fetch = FetchType.EAGER ，否則無法從訂單找明細
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy = "orderBean",fetch = FetchType.EAGER)
	private Set<OrderItemBean> items = new LinkedHashSet<>();
	private String company_id;  //統編號碼
	
	private String company_title;  //統編title
	
	private String invoice_num;  //發票號碼
	
	private java.util.Date order_datetime;
	
	@JsonIgnoreProperties("orderBeans")
	@ManyToOne
	@JoinColumn(name = "FK_shiptype_id")
	private ShipTypeBean shipTypeBean;   //fk配送狀態:對應到配送表格(雙向多對一)
	
	@JsonIgnoreProperties("orderBeans")
	@ManyToOne
	@JoinColumn(name = "FK_paytype_id")
	private PayTypeBean payTypeBean;  //fk付款方式:對應付款方式表格(雙向多對一)
						
	@JsonIgnoreProperties("orderBeans")
	
	@ManyToOne
	@JoinColumn(name = "FK_orderstatus_id")
	private OrderStatusBean orderStatusBean; //fk訂單狀態:對應訂單狀態表格(雙向多對一)
	
	private Double order_total;
	
	private Date shipping_date;
	
//	private Integer pay_me;  //用數字分辨付款方式  =>3/10不懂????by yarong
	
//	private Integer order_status_id;  //用數字分辨運送方式   =>3/10不懂????by yarong
	
	private String order_memo;

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

//	public OrderNumberBean getOrderNumberBean() {
//		return orderNumberBean;
//	}
//
//	public void setOrderNumberBean(OrderNumberBean orderNumberBean) {
//		this.orderNumberBean = orderNumberBean;
//	}

	
	public Member getMemberBean() {
		return memberBean;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public Set<OrderItemBean> getItems() {
		return items;
	}

	public void setItems(Set<OrderItemBean> items) {
		this.items = items;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getCompany_title() {
		return company_title;
	}

	public void setCompany_title(String company_title) {
		this.company_title = company_title;
	}

	public String getInvoice_num() {
		return invoice_num;
	}

	public void setInvoice_num(String invoice_num) {
		this.invoice_num = invoice_num;
	}

	public java.util.Date getOrder_datetime() {
		return order_datetime;
	}

	public void setOrder_datetime(java.util.Date order_datetime) {
		this.order_datetime = order_datetime;
	}

	public ShipTypeBean getShipTypeBean() {
		return shipTypeBean;
	}

	public void setShipTypeBean(ShipTypeBean shipTypeBean) {
		this.shipTypeBean = shipTypeBean;
	}

	public PayTypeBean getPayTypeBean() {
		return payTypeBean;
	}

	public void setPayTypeBean(PayTypeBean payTypeBean) {
		this.payTypeBean = payTypeBean;
	}

	public OrderStatusBean getOrderStatusBean() {
		return orderStatusBean;
	}

	public void setOrderStatusBean(OrderStatusBean orderStatusBean) {
		this.orderStatusBean = orderStatusBean;
	}

	public Double getOrder_total() {
		return order_total;
	}

	public void setOrder_total(Double order_total) {
		this.order_total = order_total;
	}

	public Date getShipping_date() {
		return shipping_date;
	}

	public void setShipping_date(Date shipping_date) {
		this.shipping_date = shipping_date;
	}
//
//	public Integer getPay_me() {
//		return pay_me;
//	}
//
//	public void setPay_me(Integer pay_me) {
//		this.pay_me = pay_me;
//	}
//
//	public Integer getOrder_status_id() {
//		return order_status_id;
//	}
//
//	public void setOrder_status_id(Integer order_status_id) {
//		this.order_status_id = order_status_id;
//	}

	public String getOrder_memo() {
		return order_memo;
	}

	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}

	

	
}
