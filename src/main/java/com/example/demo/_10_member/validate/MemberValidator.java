package com.example.demo._10_member.validate;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.example.demo._10_member.entity.Member;

@Component
public class MemberValidator implements Validator{

	private static final Pattern PASSWORD_REGEX = Pattern.compile("^(?!.*[^\\x21-\\x7e])(?=.{4,10})(?=.*[\\W])(?=.*[a-zA-Z])(?=.*\\d).*$");
	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");
	private static final Pattern PHONE_REGEX = Pattern.compile("^09(?=\\d{8}).{8}$");
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Member member = (Member) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username","Member.username.empty", "帳號不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullname","Member.fullname.empty", "姓名不得為空");
		
		if (member.getPassword() != null && !PASSWORD_REGEX.matcher(member.getPassword()).matches()) {
			errors.rejectValue("password", "Member.password.invalid","大小寫英文加數字長度最低為4且要有特殊符號");
		}	
		
		if (member.getPhone() == null || !PHONE_REGEX.matcher(member.getPhone()).matches()) {
			errors.rejectValue("phone", "Member.phone.invalid","必須是09XX-XXX-XXX");
		}
		
		if (member.getEmail() == null || !EMAIL_REGEX.matcher(member.getEmail()).matches()) {
			errors.rejectValue("email", "customerBean.email.invalid","email格式錯誤");
		}
		
		if (! member.getPassword().equals(member.getNewpassword())) {
			errors.rejectValue("password","", "密碼欄與確認密碼不一致");
		}
		
	}

}
