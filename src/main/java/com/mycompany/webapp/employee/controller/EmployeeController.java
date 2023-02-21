package com.mycompany.webapp.employee.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.EmployeeService;
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Grade;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.service.DepartmentService;
import com.mycompany.webapp.group.service.GradeService;
import com.mycompany.webapp.group.service.TeamService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/employee")
@Controller
@Log4j2
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private TeamService teamService;
	@Autowired
	private GradeService gradeService;

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
	
	/**
	 * 
	 * @param employee : 사원 정보 DTO
	 * @param model : 화면에 로그인 에러 메세지 나타냄
	 * @param session : loginEmployee을 담을 세션
	 * @return : 잘못된 로그인일 때 login, 초기 비밀번호시 change 페이지로 리다이렉트, 그렇지 않으면 홈으로 리다이렉트
	 */
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
		return "redirect:/";
	}
	
	/**
	 * 
	 * @return 회원 등록 페이지
	 * @param model : 화면에 부서, 팀, 직급, 매니저 리스트 담아 보여줌
	 */
	@GetMapping("/register")
	public String register(Model model) {
		log.info("실행");
		//부서 List
		List<Department> departments = departmentService.getDeptList();
		System.out.println(departments);
		model.addAttribute("departments", departments);
		//팀 List
		List<Team> teams = teamService.getTeamList();
		model.addAttribute("teams", teams);
		//직급 List
		List<Grade> grades = gradeService.getGradeList();
		model.addAttribute("grades", grades);
		
		return "employee/register";
	}
	
	/**
	 * 
	 * @author : LEEYESEUNG
	 * @param deptId
	 * @return teamList
	 * @throws IOException
	 */
	@PostMapping(value="/teamlist")
	@ResponseBody
	public List<Team> teamListAjax(@Param("deptId") String deptId) throws IOException {
		log.info("실행");
		int id = Integer.parseInt(deptId);
		List<Team> teamList = teamService.getTeamListById(id);
		
		return teamList;
	}
	
	@PostMapping(value="/check")
	@ResponseBody
	public boolean checkId(@Param("empId") String empId) throws IOException {
		System.out.println(empId);
		log.info("실행");
		boolean result = employeeService.checkId(empId);
		return result;
	}

}
