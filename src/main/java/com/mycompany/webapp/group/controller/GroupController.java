package com.mycompany.webapp.group.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	//private IEmployeeService employeeService;
	
	/**
	 * 부서 이름 목록 메서드
	 * 
	 * @author : LEEJIHO
	 * @param model
	 * @return hr/hr.jsp
	 */
	@GetMapping("/department/list")
	public String getDeptList(Model model) {
		log.info("실행");
		
		List<List<Team>> teamList = new ArrayList<>();		
		List<Department> departments = departmentService.getDeptList();
		for(Department dept : departments) {
			teamList.add(teamService.getTeamList(dept.getDeptId()));
			log.info(teamList);
		}
		model.addAttribute("departments", departments);
		model.addAttribute("teamList", teamList);
		return "hr/hr";
	}
	
}
