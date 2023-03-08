package com.mycompany.webapp.vacation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.service.IDepartmentService;
import com.mycompany.webapp.group.service.ITeamService;
import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDate;
import com.mycompany.webapp.vacation.model.VacationLine;
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
	public String getVacationList(Model model) {
		log.info("실행");
		
		return "vacation/vacation_docu";
	}
	
	@GetMapping("/vacation/my")
	public String getMyVacation(Model model) {
		log.info("실행");
		
		return "vacation/myvacation";
	}
	
	@PostMapping("/vacation/employee")
	@ResponseBody
	public List<VacationLine> getEmployeeInfo(@RequestParam(value="line[]") String[] line, Model model) {
		log.info("실행");
		
		List<VacationLine> vacationLines = new ArrayList<>();
		
		for(int i = 0; i < line.length; i++) {
			VacationLine vacationLine = vacationService.getVacationLine(line[i]);
			vacationLine.setSeq(i+1);
			vacationLines.add(vacationLine);
		}
		
		return vacationLines;
	}
	
	@PostMapping("/vacation/write")
	public String writeApproval(@ModelAttribute Vacation vacation, Model model) throws ParseException {
		log.info("실행");
		log.info(vacation);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
		String[] dates = vacation.getDates().split(",");
		List<VacationDate> date= new ArrayList<>();
 		
 		//날짜 리스트 
 		for(int i=0; i < dates.length; i++) {
 			VacationDate vacationDate = new VacationDate();
 			vacationDate.setStartDate(formatter.parse(dates[i]));
 			vacationDate.setEndDate(formatter.parse(dates[i]));
 			date.add(vacationDate);
 		}
 		vacation.setVacationDate(date);
 		
 		//결제선 리스트
		for(int i = 0; i < vacation.getVacationLine().size(); i++) {
			vacation.getVacationLine().get(i).setSeq(i+1);
		}
		vacationService.writeVacation(vacation);
		
		return "붐따";
	}
}
