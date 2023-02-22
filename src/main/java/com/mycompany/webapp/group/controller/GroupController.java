package com.mycompany.webapp.group.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.service.IDepartmentService;
import com.mycompany.webapp.group.service.ITeamService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class GroupController {
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private ITeamService teamService;
	
	@Autowired
	private IEmployeeService employeeService;
	
	/**
	 * 조직도 기능
	 * 
	 * @author : LEEJIHO
	 * @param model
	 * @return hr/hr.jsp
	 */
	@GetMapping("/hr/list")
	public String getDeptList(@RequestParam(defaultValue="1") int pageNo, Model model) {
		log.info("실행");
		
		int rowEmployee = employeeService.getTotalRows();
		Pager pager = new Pager(10, 5, rowEmployee, pageNo);
		log.info("행수: " + rowEmployee);
		
		List<List<Team>> teams = new ArrayList<>();
		
		//부서 목록
		List<Department> departments = departmentService.getDeptList();
		
		//부서 별 팀목록
		for(Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
		}
		
		//사원 목록
		List<Employee> employees = employeeService.getEmpList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		model.addAttribute("employees", employees);
		
		return "hr/hr2";
	}
	
	// 검색
	@GetMapping("/employee/search")
	@ResponseBody
	public List<Employee> getSearchEmpList(@RequestParam(defaultValue="1") int pageNo,
			@RequestParam("type") String type, @RequestParam("keyword") String keyword, Model model) {
		
		log.info("실행");
		
		Employee employee = new Employee();
		employee.setType(type);
		employee.setKeyword(keyword);
		
		int searchEmpRow = employeeService.getSearchEmpRows(employee);
		Pager pager = new Pager(10, 5, searchEmpRow, pageNo);
		log.info("검색 행수: " + searchEmpRow);
		
		//검색한 사원 목록
		List<Employee> employees = employeeService.getSearchEmpList(pager, employee);
		log.info("검색 사원: "+ employees);
		model.addAttribute("pager", pager);
		model.addAttribute("employees", employees);
		return employees;
		
	}
	
}
