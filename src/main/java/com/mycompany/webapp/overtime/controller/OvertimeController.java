package com.mycompany.webapp.overtime.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.service.IDepartmentService;
import com.mycompany.webapp.group.service.ITeamService;
import com.mycompany.webapp.overtime.model.Overtime;
import com.mycompany.webapp.overtime.service.IOvertimeService;
import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDate;
import com.mycompany.webapp.vacation.model.VacationDetail;
import com.mycompany.webapp.vacation.model.VacationList;
import com.mycompany.webapp.vacation.service.IVacationService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class OvertimeController {
	@Autowired
	private IOvertimeService overtimeService;
	@Autowired
	private IDepartmentService departmentService;
	@Autowired
	private ITeamService teamService;
	@Autowired
	private IEmployeeService employeeService;
	@Autowired
	private IVacationService vacationService;

	// 1. 근무 신청
	@GetMapping("/overtime/write")
	public String getDepList(Model model) {
		log.info("실행");
		List<List<Team>> teams = new ArrayList<>();
		List<Department> departments = departmentService.getDeptList();
		for (Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
		}
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		return "overtime/overtime_writeform";
	}

	// 2. 근무 신청 제출
	@PostMapping("/overtime/write")
	public String writeApproval(@ModelAttribute Overtime overtime, Model model) {
		log.info("실행");
		log.info(overtime);
		overtimeService.writeOvertime(overtime);
		return "redirect:/overtime/list/1";
	}
	//3. 나의 근무
	@GetMapping("/overtime/list/{type}")
	public String getMyOverTime(@PathVariable int type, @RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(value = "status", defaultValue = "") String status, Model model, HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		int overtimeRow = overtimeService.getOvertimeRow(empId, status ,type);
		Pager pager = new Pager(10, 5, overtimeRow, pageNo);
		List<Overtime> overtimeList = overtimeService.getOvertimeList(pager, empId, status ,type);
		
		model.addAttribute("overtimeList", overtimeList);
		model.addAttribute("pager", pager);
		model.addAttribute("status", status);
		return "overtime/overtime_list";
	}
	
	// 4. 근무 신청 상세보기
		@GetMapping("overtime/detail")
		public String detail(@RequestParam int overtimeId, @RequestParam int pageNo, @RequestParam() String status,
				Model model, HttpSession session) {
			log.info("실행");
			Employee emp = (Employee) session.getAttribute("loginEmployee");
			String empId = emp.getEmpId();
			
			Overtime overtime = overtimeService.getOvertimeDetail(overtimeId);
			
			Employee employee;
			if(empId.equals(overtime.getEmpId())) {
				
				 employee = employeeService.getEmp(overtime.getApprovalEmpId());
					
			}else {
				 employee = employeeService.getEmp(overtime.getEmpId());
			}
			log.info(overtime);
			log.info("dork sjgdjwla"+ employee);
			model.addAttribute("employee", employee);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("status", status);
			model.addAttribute("overtime", overtime);
			return "overtime/overtime_detail";
		}
	
}
