package com.mycompany.webapp.employee.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.employee.model.EmpValidator;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.EmployeeService;
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Grade;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.service.IDepartmentService;
import com.mycompany.webapp.group.service.IGradeService;
import com.mycompany.webapp.group.service.ITeamService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/employee")
@Controller
@Log4j2
public class EmployeeController {
	
	@Autowired
	private IEmployeeService employeeService;
	@Autowired
	private IDepartmentService departmentService;
	@Autowired
	private ITeamService teamService;
	@Autowired
	private IGradeService gradeService;
	@Autowired
	private EmpValidator empValidator;
	
	@InitBinder("employee")
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(empValidator);
	}

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
		Employee dbEmployee = employeeService.getEmp(employee.getEmpId());
		session.setAttribute("loginEmployee", dbEmployee);
		System.out.println(dbEmployee);
		return "redirect:/";
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
	
	/**
	 * 
	 * @author : LEEJIHO
	 * @param empId : 사원아이디
	 * @return 사원 정보
	 */
	@GetMapping("/empinfo")
	@ResponseBody
	public Employee employeeInfo(@RequestParam("empId") String empId) {
		log.info("실행");
		Employee employee = employeeService.getEmp(empId);
		log.info(employee);
		return employee;
	}
	
	/**
	 * @author : LEEYESEUNG
	 * @param empId : 사원아이디
	 * @return result : 중복 검사
	 * @throws IOException
	 */
	@PostMapping(value="/check")
	@ResponseBody
	public boolean checkId(@Param("empId") String empId) throws IOException {
		log.info("실행");
		boolean result = employeeService.checkId(empId);
		return result;
	}
	
	/**
	 * @author : LEEYESEUNG
	 * @return 회원 등록 페이지
	 * @param model : 화면에 부서, 팀, 직급, 매니저 리스트 담아 보여줌
	 */
	@GetMapping("/register")
	public String register(Model model, @ModelAttribute("employee") Employee employee) {
		log.info("실행");
		//부서 List
		List<Department> departments = departmentService.getDeptList();
		model.addAttribute("departments", departments);
		//직급 List
		List<Grade> grades = gradeService.getGradeList();
		model.addAttribute("grades", grades);
		
		return "employee/register";
	}	
	
	@PostMapping(value="/register")
	public String register(Model model, @Valid @ModelAttribute("employee") Employee employee, BindingResult errors) throws Exception{
		log.info("실행");
		//정규식 유효성 검사
		if(errors.hasErrors()) {
			log.info("errors: "+errors);
			//부서 List
			List<Department> departments = departmentService.getDeptList();
			model.addAttribute("departments", departments);
			
			//직급 List 
			List<Grade> grades = gradeService.getGradeList();
			model.addAttribute("grades", grades);
			
			return "employee/register";
		}
		try {
			//insert했을 때 오류가 나면 catch로 오류 제어
			int row = employeeService.register(employee);
			
			//아이디 중복 오류를 잡는다
		} catch (AlreadyExistingIdException e) {
			errors.rejectValue("empId", "이미 가입된 아이디입니다.");
			//부서 List
			List<Department> departments = departmentService.getDeptList();
			model.addAttribute("departments", departments);
			//직급 List 
			List<Grade> grades = gradeService.getGradeList();
			model.addAttribute("grades", grades);
			log.info("errors: "+errors);
			return "employee/register";
			
			//매니저 아이디가 없으면 삽입할 수 없다
		} catch (NotExistingManagerException e) {
			errors.rejectValue("managerId", "없는 매니저 아이디 입니다.");
			errors.rejectValue("empId", "이미 가입된 아이디입니다.");
			//부서 List
			List<Department> departments = departmentService.getDeptList();
			model.addAttribute("departments", departments);
			//직급 List 
			List<Grade> grades = gradeService.getGradeList();
			model.addAttribute("grades", grades);
			log.info("errors: "+errors);
			return "employee/register";
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("실행");
		session.removeAttribute("loginEmployee");
		return "redirect:/";
	}
	
}
