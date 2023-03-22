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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.component.Holiday;
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

	/**
	 * 휴가 신청서 폼 
	 * @author : LEEYENOHEE
	 * @return : 부서List, 공휴일List를 model저장 -> vacation_writeform.jsp
	 */
	@GetMapping("/vacation/write")
	public String write(Model model, HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empIdorigine = employee.getEmpId();
		Employee updateEmp = employeeService.getEmp(empIdorigine);
		session.setAttribute("loginEmployee", updateEmp);
		List<List<Team>> teams = new ArrayList<>();
		List<Department> departments = departmentService.getDeptList();
		for (Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
		}
		Holiday holiday = new Holiday();
		List<String> holidays = holiday.holidaysFomat("2023");
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		model.addAttribute("holidays", holidays);
		return "vacation/vacation_writeform";
	}

	/**
	 * 휴가 신청서 -> 결재선 선택 
	 * @author : LEEYENOHEE
	 * @return : 팀List
	 */
	@GetMapping("/vacation/getemps/{teamid}")
	@ResponseBody
	public List<Employee> getEmps(@PathVariable int teamid) {
		List<Employee> emplist = employeeService.getEmpList(teamid);
		return emplist;
	}

	/**
	 * 휴가 신청서 -> 결재선 선택 
	 * @author : LEEYENOHEE
	 * @return : 사원 List
	 */
	@PostMapping("/vacation/employee")
	@ResponseBody
	public Vacation getEmployeeInfo(@RequestParam String empId, Model model) {
		log.info("실행");
		Vacation vacation = vacationService.getApprovalEmp(empId);
		return vacation;
	}

	/**
	 * 휴가 신청서 제출
	 * @author : LEEYENOHEE
	 * @return : 휴가 목록
	 */
	@PostMapping("/vacation/write") 
	public String writeApproval(@ModelAttribute Vacation vacation, Model model, HttpSession session) throws ParseException {
		log.info("실행");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		List<VacationDate> date = new ArrayList<>();
		if (vacation.getVacationType() == 2) {
			VacationDate vacationDate = new VacationDate();
			vacationDate.setStartDate(formatter.parse(vacation.getStartDate()));
			vacationDate.setEndDate(formatter.parse(vacation.getEndDate()));
			date.add(vacationDate);
			vacation.setVacationDate(date);
		} else {
			String[] dates = vacation.getDates().split(",");
			for (int i = 0; i < dates.length; i++) {
				VacationDate vacationDate = new VacationDate();
				vacationDate.setStartDate(formatter.parse(dates[i]));
				vacationDate.setEndDate(formatter.parse(dates[i]));
				date.add(vacationDate);
			}
			vacation.setVacationDate(date);
		}
		vacationService.writeVacation(vacation);
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		Employee updateEmp = employeeService.getEmp(empId);
		session.setAttribute("loginEmployee", updateEmp);
		return "redirect:/vacation/list/1";
	}

	/**
	 * 내 문서함 -> 휴가 신청 목록
	 * @author : LEEYENOHEE
	 * @return : 휴가 목록
	 */
	@GetMapping("/vacation/list/{type}")
	public String getVacationList(@PathVariable int type, @RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(value = "status", defaultValue = "") String status, Model model, HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		int vacationRow = vacationService.getVacationRow(empId, status, type);
		Pager pager = new Pager(10, 5, vacationRow, pageNo);
		List<VacationList> vacationList = vacationService.getVacationList(pager, empId, status, type);
		if (type == 1) {
			Employee vacationDays = vacationService.getVacationDays(empId);
			model.addAttribute("dayoffRemain", vacationDays.getDayoffRemain());
			model.addAttribute("addDayoffRemain", vacationDays.getAddDayoffRemain());
		}
		model.addAttribute("type",type);
		model.addAttribute("vacationList", vacationList);
		model.addAttribute("pager", pager);
		model.addAttribute("status", status);
		return "vacation/vacation_list";
	}

	/**
	 * 내 문서함 -> 휴가 신청 목록 -> 휴가 상세보기
	 * @author : LEEYENOHEE
	 * @return : 선택한 휴가 신청서 상세 페이지
	 */
	@GetMapping("vacation/detail")
	public String detail(@RequestParam int vacationId, @RequestParam int pageNo, @RequestParam() String status,
			Model model, HttpSession session) {
		log.info("실행");
		VacationDetail vacationDetail = vacationService.getVacationDetail(vacationId);
		List<VacationDate> vacationDate = vacationService.getVacationDate(vacationId);
		Vacation vacation = vacationService.getApprovalEmp(vacationDetail.getApprovalEmpId());
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("status", status);
		model.addAttribute("vacationDetail", vacationDetail);
		model.addAttribute("vacationDate", vacationDate);
		model.addAttribute("vacation", vacation);
		return "vacation/vacation_detail";
	}
	
	/**
	 * 휴가 승인/반려
	 * @author : LEEYENOHEE
	 * @return : 선택한 휴가 신청서 상세 페이지
	 */
	@RequestMapping(value = "/vacation/process", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String process(@ModelAttribute Vacation vacation, Model model, HttpSession session) {
		log.info("실행");
		List<VacationDate> vacationDate = vacationService.getVacationDate(vacation.getVacationId());
		vacation.setVacationDate(vacationDate);
		vacationService.processVacation(vacation);
		
		return "success";
	}
	
	/**
	 * 휴가 삭제
	 * @author : LEEYENOHEE
	 * @return : 성공 메세지
	 */
	@RequestMapping(value = "/vacation/delete", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String delete(@ModelAttribute Vacation vacation, HttpSession session) {
		log.info("실행");
		vacationService.deleteVacation(vacation);
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empIdorigine = employee.getEmpId();
		Employee updateEmp = employeeService.getEmp(empIdorigine);
		session.setAttribute("loginEmployee", updateEmp);
		return "success";
	}

}
