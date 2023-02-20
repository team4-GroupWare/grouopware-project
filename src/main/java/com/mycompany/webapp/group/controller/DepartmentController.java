package com.mycompany.webapp.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.service.IDepartmentService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class DepartmentController {
	@Autowired
	private IDepartmentService departmentService;
	
	@GetMapping("/department/list")
	public String getDeptList(Model model) {
		log.info("실행");
		
		List<Department> departments = departmentService.getDeptList();
		
		model.addAttribute("departments", departments);
		return "hr/hr.jsp";
	}
}
