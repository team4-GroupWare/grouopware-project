package com.mycompany.webapp.employee.model;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import lombok.extern.log4j.Log4j2;
@Component
@Log4j2
public class EmpValidator implements Validator {
	
	private static final String passwordRegExp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$";
	private static final String phoneRegExp = "^010-\\d{3,4}-\\d{4}$";
	
	private Pattern passwordPattern;
	private Pattern phonePattern;
	
	
	public EmpValidator() {
		passwordPattern = Pattern.compile(passwordRegExp);
		phonePattern = Pattern.compile(phoneRegExp);
		
	}
	
	/**
	 * @author LEE YESEUNG
	 * @param clazz : 검증하려는 클래스 체크를 위함
	 * @return : 해당 클래스의 대한 값 검증을 지원하는가
	 */
	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return Employee.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		Employee employee = (Employee) target;
		Matcher matcher = passwordPattern.matcher(employee.getPassword());
		if(!matcher.matches()) {
			errors.rejectValue("password", null,"비밀번호는 8자 이상, 특수문자 하나를 포함해주세요.");
		}
		
		
		matcher = phonePattern.matcher(employee.getPhone());
		if(!matcher.matches()) {
			errors.rejectValue("phone", null, "010-0000-0000 형식으로 입력해주세요.");
		}
		
		if(employee.getDeptId()==0) {
			errors.rejectValue("deptId", null, "필수로 선택해주세요.");
		}
		
		if(employee.getEmpId().equals("")) {
			errors.rejectValue("empId", null, "아이디를 입력해주세요");
		}
		
		
		if(employee.getName().equals("")) {
			errors.rejectValue("name", null, "이름을 입력해주세요");
		}
		
	}


}
