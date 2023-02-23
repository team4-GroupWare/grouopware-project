package com.mycompany.webapp.group.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	 * 조직도(인사) 사원 목록 조회
	 * 
	 * @author : LEEJIHO
	 * @param pageNo
	 * @param type
	 * @param keyword
	 * @param model
	 * @return
	 */
	@GetMapping("/hr/list")
	public String getEmpList(@RequestParam(defaultValue="1") int pageNo,
			@RequestParam(defaultValue="") String type, @RequestParam(defaultValue="") String keyword, Model model) {
		
		log.info("실행");
		List<List<Team>> teams = new ArrayList<>();
		
		//부서 목록
		List<Department> departments = departmentService.getDeptList();
		
		//부서 별 팀목록
		for(Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
		}
		
		Employee employee = new Employee();
		employee.setType(type);
		employee.setKeyword(keyword);
		
		int searchEmpRow = employeeService.getSearchEmpRows(employee);
		log.info("검색 행수: " + searchEmpRow);
		
		//검색한 사원 목록
		Pager pager = new Pager(10, 5, searchEmpRow, pageNo);
		List<Employee> employees = employeeService.getSearchEmpList(pager, employee);
		log.info("검색 사원: "+ employees);
		
		model.addAttribute("pager", pager);
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		model.addAttribute("employees", employees);
		
		return "hr/hr";
		
	}
	
}
