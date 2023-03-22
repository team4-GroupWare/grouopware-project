package com.mycompany.webapp.overtime.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.attendance.service.IAttendanceService;
import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.service.IDepartmentService;
import com.mycompany.webapp.group.service.ITeamService;
import com.mycompany.webapp.overtime.model.Overtime;
import com.mycompany.webapp.overtime.service.IOvertimeService;

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
	private IAttendanceService attendanceService;
	@Autowired
	private IEmployeeService employeeService;

	/**
	 * 근무신청서 조회
	 * @author : LEEYENOHEE
	 * @return : 근무신청 폼 
	 */
	@GetMapping("/overtime/write")
	public String getWriteForm(Model model, HttpSession session) {
		log.info("실행");
		List<List<Team>> teams = new ArrayList<>();
		List<Department> departments = departmentService.getDeptList();
		for (Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
		}
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		String sunday = formatter.format(c.getTime());
		int weekOverTime = overtimeService.getweekOverTime(sunday, empId);
		model.addAttribute("weekOverTime", weekOverTime);
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		return "overtime/overtime_writeform";
	}

	/**
	 * 근무신청서 제출
	 * @author : LEEYENOHEE
	 * @return : 조건에 맞지 않으면 에러 메세지, 조건에 맞으면 success 
	 */
	@RequestMapping(value = "/overtime/write", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String submitWriteForm(@ModelAttribute Overtime overtime, Model model) {
		log.info("실행");
		SimpleDateFormat transFormat = new SimpleDateFormat("yy.MM.dd");
		String workDate = transFormat.format(overtime.getWorkDate());
		String status = attendanceService.getThisWeekStatus(workDate, overtime.getEmpId());
		if (status == null || status.equals("결근")) {
			return "해당 날짜에 출근기록이 있어야 신청가능합니다.";
		} else if (status.equals("연장근무")) {
			return "해당 날짜에 이미 연장근무 신청이 되어있습니다.";
		} else if (status.equals("출근") || status.equals("지각")) {
			overtimeService.writeOvertime(overtime);
			return "success";
		} else {
			return "휴가사용날짜에 연장근무신청이 불가합니다.";
		}
	}

	/**
	 * 근무신청목록 List
	 * @author : LEEYENOHEE
	 * @return : 근무신청목록 list.jsp
	 */
	@GetMapping("/overtime/list/{type}")
	public String OvertimeList(@PathVariable int type, @RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(value = "status", defaultValue = "") String status, Model model, HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		int overtimeRow = overtimeService.getOvertimeRow(empId, status, type);
		Pager pager = new Pager(10, 5, overtimeRow, pageNo);
		List<Overtime> overtimeList = overtimeService.getOvertimeList(pager, empId, status, type);
		model.addAttribute("overtimeList", overtimeList);
		model.addAttribute("pager", pager);
		model.addAttribute("status", status);
		return "overtime/overtime_list";
	}

	/**
	 * 근무신청서 상세보기
	 * @author : LEEYENOHEE
	 * @return : 근무신청 상세보기
	 */
	@GetMapping("/overtime/detail")
	public String detailOvertime(@RequestParam int overtimeId, @RequestParam int pageNo, @RequestParam() String status,
			Model model, HttpSession session) {
		log.info("실행");
		Employee emp = (Employee) session.getAttribute("loginEmployee");
		String empId = emp.getEmpId();
		Overtime overtime = overtimeService.getOvertimeDetail(overtimeId);
		Employee employee;
		if (empId.equals(overtime.getEmpId())) {
			employee = employeeService.getEmp(overtime.getApprovalEmpId());
		} else {
			employee = employeeService.getEmp(overtime.getEmpId());
		}
		model.addAttribute("employee", employee);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("status", status);
		model.addAttribute("overtime", overtime);
		return "overtime/overtime_detail";
	}

	/**
	 * 근무신청 승인반려
	 * @author : LEEYENOHEE
	 * @return : 조건별 message 리턴
	 */
	@RequestMapping(value = "/overtime/process", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String process(@ModelAttribute Overtime overtime, Model model) {
		log.info("실행");
		String status = attendanceService.getThisWeekStatus(overtime.getWorkDateDetail(), overtime.getEmpId());
		int clockOut = 18 + overtime.getWorkTime();
		String workDateClock = overtime.getWorkDateDetail() + " " + clockOut + ":00:00";
		if (overtime.getType().equals("y")) {
			if (status == null || status.equals("결근")) {
				return "해당 날짜에 출근기록이 있어야 신청가능합니다.";
			} else if (status.equals("연장근무")) {
				return "해당 날짜에 이미 연장근무 신청이 되어있습니다.";
			} else if (status.equals("출근") || status.equals("지각")) {
				overtime.setWorkDateClock(workDateClock);
				overtimeService.overTimeProcess(overtime);
				return "success";
			} else {
				return "휴가사용날짜에 연장근무신청이 불가합니다.";
			}
		} else {
			log.info(overtime);
			overtimeService.overTimeProcess(overtime);
			return "success";

		}
	}
	/**
	 * 연장근무 삭제
	 * @author : LEEYENOHEE
	 * @return : 성공 메세지
	 */
	@RequestMapping(value = "/overtime/delete", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String delete(@ModelAttribute Overtime overtime) {
		log.info("실행");
		overtimeService.deleteOvertime(overtime);
		return "success";
	}

}
