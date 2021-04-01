package com.example.demo._20_shoppingMall._23_orderProcess.exception;

public class ProductStockException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ProductStockException() {
	}

	public ProductStockException(String message) {
		super(message);
	}

	public ProductStockException(Throwable cause) {
		super(cause);
	}

	public ProductStockException(String message, Throwable cause) {
		super(message, cause);
	}

	public ProductStockException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
