package com.mycompany.webapp.vacation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.service.IDepartmentService;
import com.mycompany.webapp.group.service.ITeamService;
import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDate;
import com.mycompany.webapp.vacation.model.VacationDetail;
import com.mycompany.webapp.vacation.model.VacationLine;
import com.mycompany.webapp.vacation.model.VacationList;
import com.mycompany.webapp.vacation.service.IVacationService;

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
	
	@Autowired
	private IVacationService vacationService;
	
	
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
	
	@GetMapping("/vacation/document")
	public String getVacationList(Model model,HttpSession session) {
		log.info("실행");
		
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		
		
		
		
		
		return "vacation/vacation_approval";
	}
	
	@GetMapping("/vacation/my")
	public String getMyVacation(@RequestParam(defaultValue="1") int pageNo, @RequestParam(value="status", defaultValue="") String status, Model model, HttpSession session) {
		log.info("실행");
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		
		int vacationRow = vacationService.getVacationRow(empId, status);
		log.info(vacationRow);
		Pager pager = new Pager(10, 5, vacationRow, pageNo);
		List<VacationList> vacationList = vacationService.getVacationList(pager, empId, status);
		
		Employee vacationDays = vacationService.getVacationDays(empId);
		
		model.addAttribute("dayoffRemain", vacationDays.getDayoffRemain());
		model.addAttribute("addDayoffRemain", vacationDays.getAddDayoffRemain());
		model.addAttribute("vacationList", vacationList);
		model.addAttribute("pager", pager);
		model.addAttribute("status", status);
		return "vacation/myvacation";
	}
	
	@PostMapping("/vacation/employee")
	@ResponseBody
	public Vacation getEmployeeInfo(@RequestParam String empId, Model model) {
		log.info("실행");
		log.info(empId);
		Vacation vacation = vacationService.getApprovalEmp(empId);
		log.info(vacation);
		return vacation;
	}
	
	@PostMapping("/vacation/write")
	public String writeApproval(@ModelAttribute Vacation vacation, Model model) throws ParseException {
		log.info("실행");
		log.info(vacation);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		List<VacationDate> date= new ArrayList<>();
		
		//날짜 리스트
		if(vacation.getVacationType()==2) {
			VacationDate vacationDate = new VacationDate();
 			vacationDate.setStartDate(formatter.parse(vacation.getStartDate()));
 			vacationDate.setEndDate(formatter.parse(vacation.getEndDate()));
 			date.add(vacationDate);
 			vacation.setVacationDate(date);
		
		}else{
			String[] dates = vacation.getDates().split(",");
	 		for(int i=0; i < dates.length; i++) {
	 			VacationDate vacationDate = new VacationDate();
	 			vacationDate.setStartDate(formatter.parse(dates[i]));
	 			vacationDate.setEndDate(formatter.parse(dates[i]));
	 			date.add(vacationDate);
	 		}
	 		vacation.setVacationDate(date);
		}
		
		vacationService.writeVacation(vacation);
		
		return "redirect:/vacation/my";
	}
	
	@GetMapping("vacation/detail")
	public String detail(@RequestParam int vacationId, @RequestParam int pageNo, @RequestParam() String status, Model model, HttpSession session) {
		log.info("실행");
		VacationDetail vacationDetail = vacationService.getVacationDetail(vacationId);
		List<VacationDate> vacationDate = vacationService.getVacationDate(vacationId);
		log.info(vacationDate);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("status", status);
		model.addAttribute("vacationDetail", vacationDetail);
		model.addAttribute("vacationDate", vacationDate);
		
		log.info(vacationDetail);
		return "vacation/vacation_document";
	}
}
