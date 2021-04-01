package com.example.demo._10_member.validate;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.example.demo._10_member.entity.Member;

@Component
public class PasswordValidator implements Validator{

	private static final Pattern PASSWORD_REGEX = Pattern.compile("^(?!.*[^\\x21-\\x7e])(?=.{4,10})(?=.*[\\W])(?=.*[a-zA-Z])(?=.*\\d).*$");

	
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Member member = (Member) target;

		if (member.getPassword() != null && !PASSWORD_REGEX.matcher(member.getPassword()).matches()) {
			errors.rejectValue("password", "Member.password.invalid","大小寫英文加數字長度最低為4且要有特殊符號");
		}
		
		if (! member.getPassword().equals(member.getNewpassword())) {
			errors.rejectValue("password","", "密碼欄與確認密碼不一致");
		}
		
	}

}








