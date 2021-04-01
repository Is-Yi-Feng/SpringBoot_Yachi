package com.example.demo._20_shoppingMall._23_orderProcess.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.example.demo._02_model.entity.OrderBean;

public class OrderValidator implements Validator{

	/**
	 * 回傳boolean值，表是否支援對所傳入物件進行驗證，
	 * 只有是true的情況下才會使用validate()方法進行驗證工作。
	 */
	@Override
	public boolean supports(Class<?> clazz) {
		return OrderBean.class.isAssignableFrom(clazz);
	}
	/**
	 * validate(Object target, Errors errors) 方法參數中：
	 * target：表傳入的表單物件，可對它進行驗證
	 * 如果有錯誤，可使用Errors的 reject()或rejectValue()等方法加入錯誤訊息，
	 * 在後續的處理中，若errors物件中包括錯誤訊息，會回到getViewPage ()所設定的頁面。
	 */
	@Override
	public void validate(Object target, Errors errors) {
		OrderBean bean = (OrderBean) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "order_address", "", "*配送地址不能空白喔！");
		
		
		if (bean.getShipTypeBean().getShip_type_id() == -1) {
			errors.rejectValue("shipTypeBean","", "*必須挑選取貨方式！");
		}
		if (bean.getPayTypeBean().getPay_type_id() == -1) {
			errors.rejectValue("payTypeBean","", "*必須挑選付款方式！");
		}
	}

}
