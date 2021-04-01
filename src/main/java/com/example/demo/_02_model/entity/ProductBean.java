package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "Product")
public class ProductBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer product_id;
	
	private String product_name;
	
	//0 為顯示商品 (因訂單明細要存商品外鍵，故不可把產品刪除，以狀態碼代表刪除產品)
	@Column(nullable = false, columnDefinition = "INT default 0")
	private Integer product_status = 0;
	
	@Min(value=0, message="數值必須大於0")
	private Double product_price;
	
	private Integer product_stock;
	
	@Column(length = 65535,columnDefinition = "Text")
	private String product_info;
	
	@JsonIgnore
	private Blob product_pic;
	@JsonIgnore
	private Blob product_picA;
	
	

	private Date product_release ;
	
	private String filename;
	
	private String filenameA;
	
	
    private String product_spec;
    
    @Transient
    private Integer product_type_id;
    
    @JsonIgnoreProperties("products")
	@ManyToOne
	@JoinColumn(name = "FK_product_type_id")
	private ProductTypeBean productTypeBean;
	
	private String product_memo;

	@JsonIgnore
	@Transient
	private MultipartFile productImage; //上傳照片用
	
	@JsonIgnore
	@Transient
	private MultipartFile productImagesA;//上傳照片用
	
	
	public MultipartFile getProductImage() {
		return productImage;
	}


	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public Blob getProduct_picA() {
		return product_picA;
	}


	public void setProduct_picA(Blob product_picA) {
		this.product_picA = product_picA;
	}


	public String getFilenameA() {
		return filenameA;
	}


	public void setFilenameA(String filenameA) {
		this.filenameA = filenameA;
	}


	public MultipartFile getProductImagesA() {
		return productImagesA;
	}


	public void setProductImagesA(MultipartFile productImagesA) {
		this.productImagesA = productImagesA;
	}
	
	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public Double getProduct_price() {
		return product_price;
	}

	public void setProduct_price(Double product_price) {
		this.product_price = product_price;
	}

	public Integer getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(Integer product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public Blob getProduct_pic() {
		return product_pic;
	}

	public void setProduct_pic(Blob product_pic) {
		this.product_pic = product_pic;
	}
	

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public ProductTypeBean getProductTypeBean() {
		return productTypeBean;
	}

	public void setProductTypeBean(ProductTypeBean productTypeBean) {
		this.productTypeBean = productTypeBean;
	}

	public String getProduct_memo() {
		return product_memo;
	}

	public void setProduct_memo(String product_memo) {
		this.product_memo = product_memo;
	}
	

	public String getProduct_spec() {
		return product_spec;
	}

	public void setProduct_spec(String product_spec) {
		this.product_spec = product_spec;
	}
	
	public ProductBean(String product_name, Integer product_status,
			@Min(value = 0, message = "數值必須大於0") Double product_price, Integer product_stock, String product_info,
			Date product_release, ProductTypeBean productTypeBean) {
		super();
		this.product_name = product_name;
		this.product_status = product_status;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_info = product_info;
		this.product_release = product_release;
		this.productTypeBean = productTypeBean;
	}


	public ProductBean() {
		super();
	}

	public Integer getProduct_type_id() {
		return product_type_id;
	}

	public void setProduct_type_id(Integer product_type_id) {
		this.product_type_id = product_type_id;
	}

	public Integer getProduct_status() {
		return product_status;
	}

	public void setProduct_status(Integer product_status) {
		this.product_status = product_status;
	}


	public Date getProduct_release() {
		return product_release;
	}


	public void setProduct_release(Date product_release) {
		this.product_release = product_release;
	}



	
	
	
}
