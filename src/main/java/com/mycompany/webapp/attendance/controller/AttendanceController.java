package com.mycompany.webapp.attendance.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.service.IAttendanceService;
import com.mycompany.webapp.employee.model.Employee;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class AttendanceController {
	
	@Autowired
	IAttendanceService attendanceService;

	/**
	 * 오늘날짜 기준 사원의 출결 조회
	 * @author LEEYEONHEE
	 * @param session		session에 저장된 사원의 ID를 사용
	 * @return attendance	해당 사원의 출결 정보를 담은 후 return
	 */
	@GetMapping("/attendanceinfo")
	@ResponseBody
	public Attendance attendanceInfo(HttpSession session) {
		log.info("실행");
		
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		
		// 오늘의 날짜
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMdd");
		String attDate = simpleDateFormat1.format(date);
		
		// 해당 사원의 오늘 출결 정보 조회
		Attendance attendance = attendanceService.getAttendance(attDate, empId);
		
		return attendance;
	}

	/**
	 * 출근 버튼 눌렀을 때, attendance 행 생성
	 * @author LEEYEONHEE
	 * @param session		session에 저장된 사원의 ID를 사용
	 * @return status		insert 후 status return	
	 * @throws IOException 
	 */
	
	@GetMapping("/attendance")
	public String attendance(HttpSession session, HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		log.info("실행");
		
		// 1.로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		
		// 2.현재시간 생성
		Date date = new Date();
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("HH");
		int time = Integer.parseInt(simpleDateFormat2.format(date));

		//3. 현재시간 기준으로 status 설정
		String status = "";
		if (time <= 8) {
			status = "출근";
		} else if (8 < time && time < 18) {
			status = "지각";
		}
		log.info(status);
		
		//4. 담긴 정보로 insert
		int result = attendanceService.insertAttendance(empId, status);
		
		//5. 결과 
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}
	
	/**
	 * 퇴근버튼 눌렀을 때, attendance의 퇴근 update
	 * @author LEEYEONHEE
	 * @param session
	 * @param response
	 * @throws IOException
	 */
	@GetMapping("/leave")
	public String leave(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		log.info("실행");
		
		// 1. 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();

		// 2. 오늘날짜 생성
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMdd");
		String attDate = simpleDateFormat1.format(date);
		
		// 3. 퇴근 시간 update
		int result = attendanceService.updateLeave(attDate, empId);
		
		//4. 결과 json
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}
	
	/**
	 * 근태 관리 눌렀을 때, 나오는 초기 화면
	 * @author LEEYEONHEE
	 * @param model		
	 * @param session
	 * @return
	 */
	@GetMapping("/attendance/status/info")
	public String attendanceStatusInfo(Model model, HttpSession session) {
		
		log.info("실행");
		
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		
		// =========================<올해 근무 현황>============================
		// 현재시간 생성
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY");
		int Year = Integer.parseInt(simpleDateFormat.format(date));

		int attCountYear = attendanceService.getattCountYear(Year, empId);
		int lateCountYear = attendanceService.getlateCountYear(Year, empId);
		int absentCountYear = attendanceService.getabsentCountYear(Year, empId);
		model.addAttribute("attCountYear", attCountYear);
		model.addAttribute("lateCountYear", lateCountYear);
		model.addAttribute("absentCountYear", absentCountYear);
		
		// =========================<월별 출석률>=============================
		//이번달 
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("MM");
		int Month = Integer.parseInt(simpleDateFormat2.format(date));
		
		//이번달의 출석, 지각, 결석 count
		int attCountMonth = attendanceService.getattCountMonth(Month, empId);
		int lateCountMonth = attendanceService.getlateCountMonth(Month, empId);
		int absentCountMonth = attendanceService.getabsentCountMonth(Month, empId);
		
		//이번달의 출석, 지각, 결석의 횟수를 model에 저장
		model.addAttribute("attCountMonth", attCountMonth);
		model.addAttribute("lateCountMonth", lateCountMonth);
		model.addAttribute("absentCountMonth", absentCountMonth);
		
		// =========================<주중 근무 현황>============================
		//이번주 날짜 list 
		Holiday h = new Holiday();
		List<String> list = h.getCurMonday();
		
		//이번주  status list
		List<String> statusThisWeek = new ArrayList<>();
		for (String i : list) {
			log.info(i);
			String status = attendanceService.getThisWeekStatus(i, empId);
			log.info(status);
			statusThisWeek.add(status);
		}
		//이번주 날짜와 이번주 status를 model에 저장
		model.addAttribute("thisweek", list);
		model.addAttribute("statusThisWeek", statusThisWeek);
		
		return "attendance/attendance_status";
	}

	/**
	 * 월별 근무 현황(달력)
	 * @author LEEYEONHEE
	 * @param session
	 * @return
	 */
	@GetMapping("/attendance/status")
	@ResponseBody
	public List<Map<String, String>> attendanceStatus(HttpSession session) {
		// =========================<공휴일>============================
		// 올해 년도
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYY");
		String today = simpleDateFormat1.format(date);
		List<Map<String, String>> answer = new ArrayList<Map<String, String>>();
		/*
		// 올해 공휴일 list
		Holiday holiday = new Holiday();
		List<String> dates = holiday.holidayArray(today);
		
		//fullCalendar에 출력을 위해 List에 담아준다.
		
		for (String d : dates) {
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", "공휴일");
			hash.put("start", d);
			hash.put("backgroundColor", "#DA5454");
			hash.put("borderColor", "#DA5454");
			answer.add(hash);
		}*/
		
		// =========================<사원의 출근 정보>============================
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		
		//사원의 모든 출근 정보 list
		List<Attendance> attendance = attendanceService.getTotalAtt(empId);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		//1번째 줄에 출근 시간과 status
		for (Attendance a : attendance) {
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", a.getClockIn() + " " + a.getStatus());
			hash.put("start", format.format(a.getAttendanceDate()));

			if (a.getStatus().equals("출근")) {
				hash.put("backgroundColor", "#49a3f1");
				hash.put("borderColor", "#49a3f1");
			} else if (a.getStatus().equals("지각")) {
				hash.put("backgroundColor", "#ffc107");
				hash.put("borderColor", "#ffc107");
			} else if (a.getStatus().equals("결근")) {
				hash.put("backgroundColor", "#808080");
				hash.put("borderColor", "#808080");
			} else if (a.getStatus().equals("휴가")) {
				hash.put("backgroundColor", "#66BB6A");
				hash.put("borderColor", "66BB6A");
			}
			answer.add(hash);
		}
		
		//2번째 줄에 퇴근시간
		for (Attendance a : attendance) {
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", a.getClockOut());
			hash.put("start", format.format(a.getAttendanceDate()));
			if (a.getStatus().equals("출근")) {
				hash.put("backgroundColor", "#49a3f1");
				hash.put("borderColor", "#49a3f1");
			} else if (a.getStatus().equals("지각")) {
				hash.put("backgroundColor", "#ffc107");
				hash.put("borderColor", "#ffc107");
			} else if (a.getStatus().equals("결근")) {
				hash.put("backgroundColor", "#808080");
				hash.put("borderColor", "#808080");
			} else if (a.getStatus().equals("휴가")) {
				hash.put("backgroundColor", "#66BB6A");
				hash.put("borderColor", "66BB6A");
			}
			answer.add(hash);
		}
		
		//공휴일과 사원 출근 정보를 모두 담은 list를 리턴
		return answer;
	}
}
