package com.example.demo._90_admin._91_editProduct.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.example.demo._02_model.entity.ProductBean;

public class ProductValidator implements Validator {

	boolean insertMode = true;
	
	public ProductValidator() {
	}

	public ProductValidator(boolean insertMode) {
		this.insertMode = insertMode;
	}

	/**
	 * 回傳boolean值，表是否支援對所傳入物件進行驗證，
	 * 只有是true的情況下才會使用validate()方法進行驗證工作。
	 */
	@Override
	public boolean supports(Class<?> clazz) {
		return ProductBean.class.isAssignableFrom(clazz);
	}

	
	/**
	 * validate(Object target, Errors errors) 方法參數中：
	 * target：表傳入的表單物件，可對它進行驗證
	 * 如果有錯誤，可使用Errors的 reject()或rejectValue()等方法加入錯誤訊息，
	 * 在後續的處理中，若errors物件中包括錯誤訊息，會回到getViewPage ()所設定的頁面。
	 */
	@Override
	public void validate(Object target, Errors errors) {
		ProductBean bean = (ProductBean) target;
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "product_name", "", "產品名稱不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "product_info", "", "*產品簡介不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "product_price", "", "*產品價格不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "product_stock", "", "*產品庫存不能空白");
		
//		Double price = Double.parseDouble(bean.getListPrice());
		
		if(bean.getProduct_name().length() < 4){
			errors.rejectValue("product_name","", "*名稱必須大於三個字");
		}
		
		if (bean.getProductTypeBean().getProduct_type_id() == -1) {
			errors.rejectValue("productTypeBean","", "*必須挑選產品種類");
		}
	}

}
