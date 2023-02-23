package com.mycompany.webapp.vacation.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.service.IDepartmentService;
import com.mycompany.webapp.group.service.ITeamService;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
public class VacationController {
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private ITeamService teamService;
	
	@Autowired
	private IEmployeeService employeeService;
	
	
	@GetMapping("/vacation/form")
	public String getDepList(Model model) {
		log.info("실행");
		List<List<Team>> teams = new ArrayList<>();
		//부서 목록
		List<Department> departments = departmentService.getDeptList();
		
		//부서 별 팀목록
		for(Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
		}
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		return "vacation/vacation_form";
	}
	
	@GetMapping("/vacation/getemps/{teamid}")
	@ResponseBody
	public List<Employee> getEmps(@PathVariable int teamid){
		List<Employee> emplist = employeeService.getEmpList(teamid);
		
		return emplist;
	}
}
