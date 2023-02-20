package com.mycompany.webapp.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.webapp.group.service.IDepartmentService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class DepartmentController {
	@Autowired
	private IDepartmentService departmentService;
	
	@GetMapping("/department/list")
	public String getDeptList() {
		log.info("실행");
		
		return "hr/hr.jsp";
	}
}
