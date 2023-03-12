package com.mycompany.webapp.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.service.IDepartmentService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class GroupController {
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private IEmployeeService employeeService;
	
	/**
	 * 조직도(인사) 사원 목록 조회
	 * 
	 * @author : LEEJIHO
	 * @param pageNo
	 * @param type
	 * @param keyword
	 * @param model
	 * @return
	 */
	@GetMapping("/hr/list/{deptId}")
	public String getEmpList(@RequestParam(defaultValue="1") int pageNo,
			@RequestParam(defaultValue="") String type, @RequestParam(defaultValue="") String keyword, 
			@PathVariable(required = false) Integer deptId, Model model) {
		
		log.info("실행");
		
		if(deptId == null) {
			deptId = 0;
		}
		
		//부서 목록
		List<Department> departments = departmentService.getDeptList();
		
		Employee employee = new Employee();
		employee.setType(type);
		employee.setKeyword(keyword);
		
		int searchEmpRow = employeeService.getSearchEmpRows(employee, deptId);
		
		//검색한 사원 목록
		Pager pager = new Pager(10, 5, searchEmpRow, pageNo);
		List<Employee> employees = employeeService.getSearchEmpList(pager, employee, deptId);
		
		model.addAttribute("pager", pager);
		model.addAttribute("departments", departments);
		model.addAttribute("employees", employees);
		model.addAttribute("deptId", deptId);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		
		return "hr/hr";
	}
	
	@GetMapping("/hr/group")
	public String getHrMain() {
		return "hr/hrmain";
	}
}
