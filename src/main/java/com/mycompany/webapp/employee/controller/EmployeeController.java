package com.mycompany.webapp.employee.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.employee.model.EmpValidator;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.model.EmployeePassword;
import com.mycompany.webapp.employee.service.EmployeeService;
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.exception.AlreadyExistingIdException;
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
		log.info(employee);
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
			Employee initEmployee = new Employee();
			initEmployee.setEmpId(employee.getEmpId());
			session.setAttribute("loginEmployee", initEmployee);
			return "redirect:/employee/change";
		}
		Employee dbEmployee = employeeService.getEmp(employee.getEmpId());
		log.info(dbEmployee);
		session.setAttribute("loginEmployee", dbEmployee);
		
		return "redirect:/";
	}
	
	@GetMapping("/change")
	public String change(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		model.addAttribute("empId", employee.getEmpId());
		return "employee/change";
	}
	
	@ResponseBody
	@PostMapping(value="/initialchange", produces="application/json; charset=UTF-8")
	public HashMap<String,String> changeInitialPwd(HttpSession session, Model model, EmployeePassword employeePassword) {
		log.info("실행");
		HashMap<String,String> result = new HashMap<>();
		
		int count = employeeService.checkPassword(employeePassword.getOldPwd(), employeePassword.getEmpId());
		
		if(count == 1) {
			employeeService.updatePassword(employeePassword.getNewPwd(), employeePassword.getEmpId());
			result.put("result", "success");
			return result;
		}
		result.put("result", "false");
		
		return result;
	}
	
	@GetMapping("/updateemployee")
	public String updateEmployee( Model model, @RequestParam String empId) {
		log.info("실행");
		Employee employee = employeeService.getEmp(empId);
		model.addAttribute("employee", employee);
		//부서 List
		List<Department> departments = departmentService.getDeptList();
		model.addAttribute("departments", departments);
		//직급 List
		List<Grade> grades = gradeService.getGradeList();
		model.addAttribute("grades", grades);
		
		return "employee/update_employee";
	}
	
	@ResponseBody
	@PostMapping(value="/grantinitial", produces="application/text; charset=UTF-8")
	public String grantInitialPwd(HttpSession session, Model model, @RequestBody EmployeePassword employeePassword) {
		log.info("실행");
		employeeService.grantInitialPassword(employeePassword);
		return "success";
		
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
	 * 사원 상세정보 보기
	 * @author : LEEJIHO
	 * @param empId : 사원아이디
	 * @return 사원 정보
	 */
	@GetMapping("/empinfo")
	@ResponseBody
	public Employee employeeInfo(@RequestParam("empId") String empId) {
		log.info("실행");
		Employee employee = employeeService.getEmp(empId);
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
	 * @param model : 화면에 부서, 팀, 직급 리스트 담아 보여줌
	 */
	@GetMapping("/register")
	public String register(Model model) {
		log.info("실행");
		//부서 List
		List<Department> departments = departmentService.getDeptList();
		model.addAttribute("departments", departments);
		//직급 List
		List<Grade> grades = gradeService.getGradeList();
		model.addAttribute("grades", grades);
		
		return "employee/register";
	}
	/**
	 * @author : LEEYESEUNG
	 * @return 유효성 검사 실행 return : 적었던 값과 함께 다시 회원 등록 페이지
	 * @return 유효성 검사 통과 return : home으로 리턴
	 * @param model : 화면에 부서, 팀, 직급 리스트와 작성했던 employee 객체
	 */
	@PostMapping(value="/register")
	public String register(Model model, @Valid @ModelAttribute("employee") Employee employee, BindingResult errors) throws Exception{
		log.info("실행");
		//정규식 유효성 검사
		if(errors.hasErrors()) {
			//부서 List
			List<Department> departments = departmentService.getDeptList();
			model.addAttribute("departments", departments);
			
			//직급 List 
			List<Grade> grades = gradeService.getGradeList();
			model.addAttribute("grades", grades);
			
			return "employee/register";
		}
		
		//직급별 연차 개수
		int dayOff = gradeService.getDayOffByGradeId(employee.getGradeId());
		//해당 입사월(현재 월)
		LocalDate now = LocalDate.now();
		int monthValue = now.getMonthValue();
		int dayoffRemain = dayOff - (monthValue);
		employee.setDayoffRemain(dayoffRemain);
		
		try {
			//insert했을 때 오류가 나면 catch로 오류 제어
			int row = employeeService.register(employee);
			
			//아이디 중복 오류를 잡는다
		} catch (AlreadyExistingIdException e) {
			errors.rejectValue("empId", null, "이미 가입된 아이디입니다.");
			//부서 List
			List<Department> departments = departmentService.getDeptList();
			model.addAttribute("departments", departments);
			//직급 List 
			List<Grade> grades = gradeService.getGradeList();
			model.addAttribute("grades", grades);
			return "employee/register";
		}
			
		return "redirect:/";
	}
	/**
	 * @author : LEEYESEUNG
	 * @param session : 만료하기 위한 session
	 * @return home으로 리다이렉트
	 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("실행");
		session.removeAttribute("loginEmployee");
		return "redirect:/";
	}
	
	@GetMapping("/myPage")
	public String myPage(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		model.addAttribute("employee", employee);
		return "employee/user_profile";
	}
	
	@GetMapping("/myUpdate")
	public String update() {
		log.info("실행");
		return "employee/user_profileupdate";
		
	}
	
	@PostMapping("/update")
	public String updatePhone(Employee employee, HttpSession session) {
		//사진 바꾸는거 해야합니다 3월 8일에..
		log.info("실행");
		Employee originEmployee = (Employee) session.getAttribute("loginEmployee");
		employee.setEmpId(originEmployee.getEmpId());
		if(employee.getProfileContentType() != null) {
			if(employee.getProfileContentType().equals("delete")) {
				employee.setProfileContentType(null);
				employee.setProfileData(null);
			} else if (originEmployee.getProfileData() !=null) {
				employee.setProfileContentType(originEmployee.getProfileContentType());
				employee.setProfileData(originEmployee.getProfileData());
			}
			
		}
		
//		if(originEmployee.getProfileData() !=null && !employee.getProfileContentType().equals("delete")) {
//			//프로필 사진을 바꾸지 않거나 사진을 삭제함
//			employee.setProfileContentType(originEmployee.getProfileContentType());
//			employee.setProfileData(originEmployee.getProfileData());
//		}
		employeeService.updateEmployee(employee);
		employee = employeeService.getEmp(employee.getEmpId());
		session.setAttribute("loginEmployee", employee);
		
		return "redirect:/employee/myPage";
	}
	
	@PostMapping("/updateemployee")
	public String updateEmployee(Employee employee, HttpSession session) {
		log.info("실행");
		if(employee.getTeamId()!=0) {
			Employee loginEmployee = (Employee) session.getAttribute("loginEmployee");
			if(loginEmployee.getEmpId().equals(employee.getEmpId())) {
				employee.setProfileContentType(loginEmployee.getProfileContentType());
				employee.setProfileData(loginEmployee.getProfileData());
			} else {
				Employee dbEmployee = employeeService.getEmp(employee.getEmpId());
				employee.setProfileContentType(dbEmployee.getProfileContentType());
				employee.setProfileData(dbEmployee.getProfileData());
			}
			
			employeeService.updateEmployee(employee);
			if(loginEmployee.getEmpId().equals(employee.getEmpId())) {
				session.setAttribute("loginEmployee", employee);
			}
		}
		return "redirect:/hr/group";
		
	}
	
	@GetMapping("/img")
	public ResponseEntity<byte[]> getImageFile(HttpSession session, @RequestParam String empId){
		Employee employee = employeeService.getEmp(empId);
		final HttpHeaders headers = new HttpHeaders();
		if(employee.getProfileContentType() != null) {
			String[] mtypes = employee.getProfileContentType().split("/");
			headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
			return new ResponseEntity<byte[]>(employee.getProfileData(), headers, HttpStatus.OK);
		} else {
			return new ResponseEntity<byte[]>(employee.getProfileData(), headers, HttpStatus.NOT_FOUND);
		}
		
	}
	
	
	
}
