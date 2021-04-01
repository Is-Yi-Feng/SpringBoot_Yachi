package com.example.demo._30_coupon._33_editCoupon.exception;

public class CouponNotFoundException extends RuntimeException {
	Integer coupon_Id;
	public CouponNotFoundException() { }
	public CouponNotFoundException(Integer coupon_Id) {
		this.coupon_Id = coupon_Id;
	}
	public Integer getBookId() {
		return coupon_Id;
	}
	public void setBookId(Integer coupon_Id) {
		this.coupon_Id = coupon_Id;
	}
	public CouponNotFoundException(String message) {
		super(message);
	}
	public CouponNotFoundException(Throwable cause) {
		super(cause);
	}
	public CouponNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}
	public CouponNotFoundException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
	public CouponNotFoundException(String message,Integer coupon_Id) {
		super(message);
		this.coupon_Id = coupon_Id;
	}
}
