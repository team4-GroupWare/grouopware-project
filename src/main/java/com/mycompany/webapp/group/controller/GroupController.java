package com.mycompany.webapp.group.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	@GetMapping("/department/list")
	public String getDeptList(Model model) {
		log.info("실행");
		
		List<List<Team>> teams = new ArrayList<>();		
		//부서 목록
		List<Department> departments = departmentService.getDeptList();
		
		//부서 별 팀목록
		for(Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
			log.info(teams);
		}
		
		//사원 목록
		List<Employee> employees = employeeService.getEmpList();
		log.info(employees);
		
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		model.addAttribute("employees", employees);
		return "hr/hr";
	}
	
}
