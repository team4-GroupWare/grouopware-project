package com.mycompany.webapp.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.EmployeeService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/employee")
@Controller
@Log4j2
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;

	/**
	 * 
	 * @author : LEEYESEUNG
	 * @return : 로그인 폼 페이지
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		log.info("실행");
		return "employee/login";
	}
	
	@PostMapping("/login")
	public String login(Employee employee, Model model, HttpSession session) {
		log.info("실행");
		EmployeeService.LoginResult loginResult = employeeService.login(employee);
		if(loginResult == EmployeeService.LoginResult.WRONG_ID) {
			//사용자의 아이디가 없는 경우
			model.addAttribute("employee", employee);
			model.addAttribute("result", "잘못된 아이디를 입력하셨습니다.");
			return "employee/login";
		} else if (loginResult == EmployeeService.LoginResult.WRONG_PASSWORD) {
			//비밀번호가 틀린 경우
			model.addAttribute("result", "비밀번호가 틀립니다.");
			return "employee/login";
		} else if (loginResult == EmployeeService.LoginResult.INITIAL_PASSWORD) {
			//초기 비밀번호인 경우
			return "redirect:/employee/chagepwd";
		}
		
		session.setAttribute("loginEmployee", employee);
		return "home";
	}

}
