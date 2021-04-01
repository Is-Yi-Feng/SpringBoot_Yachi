package com.example.demo._20_shoppingMall._21_product.exception;

public class ProductNotFoundException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	Integer product_id;
	
	
	public Integer getProduct_id() {
		return product_id;
	}
	
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	
	public ProductNotFoundException() {
	}
	
	public ProductNotFoundException(String message,Integer product_id) {
		super(message);
		this.product_id = product_id;
	}

	public ProductNotFoundException(String message) {
		super(message);
	}

	public ProductNotFoundException(Throwable cause) {
		super(cause);
	}

	public ProductNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public ProductNotFoundException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
