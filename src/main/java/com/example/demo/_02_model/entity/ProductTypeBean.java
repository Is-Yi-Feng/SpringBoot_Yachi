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
@Table(name = "Product_Type")
public class ProductTypeBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer product_type_id;
	
	private String product_type_name;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "productTypeBean",fetch = FetchType.EAGER)
	private Set<ProductBean>  products = new LinkedHashSet<>();

	public Integer getProduct_type_id() {
		return product_type_id;
	}

	public void setProduct_type_id(Integer product_type_id) {
		this.product_type_id = product_type_id;
	}

	public String getProduct_type_name() {
		return product_type_name;
	}

	public void setProduct_type_name(String product_type_name) {
		this.product_type_name = product_type_name;
	}

	public Set<ProductBean> getProducts() {
		return products;
	}

	public void setProducts(Set<ProductBean> products) {
		this.products = products;
	}

	public ProductTypeBean(Integer product_type_id, String product_type_name, Set<ProductBean> products) {
		super();
		this.product_type_id = product_type_id;
		this.product_type_name = product_type_name;
		this.products = products;
	}
	
	

	public ProductTypeBean(String product_type_name) {
		super();
		this.product_type_name = product_type_name;
	}

	public ProductTypeBean() {
		super();
	}

	@Override
	public String toString() {
		return "ProductTypeBean [product_type_id=" + product_type_id + ", product_type_name=" + product_type_name
				+  "]";
	}
	
	
	
}
