package com.mycompany.webapp.attendance.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.model.AttendanceMonthStatus;
import com.mycompany.webapp.attendance.service.IAttendanceService;
import com.mycompany.webapp.component.Holiday;
import com.mycompany.webapp.employee.model.Employee;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class AttendanceController {

	@Autowired
	IAttendanceService attendanceService;

	/**
	 * main.jsp 오늘 날짜를 기준으로 해당 사원의 출근 정보 return
	 * 
	 * @author LEEYEONHEE
	 * @param session
	 * @return attendance
	 */
	@GetMapping("/attendance/today")
	@ResponseBody
	public Attendance attendanceInfo(HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMdd");
		String attDate = simpleDateFormat1.format(date);
		Attendance attendance = attendanceService.getAttendance(attDate, empId);
		log.info(attendance);
		return attendance;
	}

	/**
	 * main.jsp 출근 버튼 눌렀을 때, attendance 행 생성
	 * 
	 * @author LEEYEONHEE
	 * @param session session에 저장된 사원의 ID를 사용
	 * @return status insert 후 status return
	 * @throws IOException
	 */

	@GetMapping("/attendance/clockin")
	public String attendance(Model model, HttpSession session) {
		log.info("실행");
		Date date = new Date();
		String message = "";
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy.mm.ss");
		String today = simpleDateFormat.format(date);
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("HH");
		int time = Integer.parseInt(simpleDateFormat2.format(date));

		// 1) 출근 상태 확인하기
		String todayStatus = attendanceService.getThisWeekStatus(today, empId);
		if (todayStatus != null) {
			if (todayStatus.contains("경조사")) {
				message = "휴가 사용중에는 출근을 하실 수 없습니다";
				model.addAttribute("message", message);
				return "main";
			} else if (todayStatus.equals("출근") && todayStatus.equals("지각")) {
				message = "출근 상태입니다.";
				model.addAttribute("message", message);
				return "main";
			} else if (todayStatus.contains("반차")) {
				if (6 <= time && time < 18) {
					int updateHalfRerult = attendanceService.updateHalfAtt(today, empId);
					return "main";
				}
			}
		}

		// 2) 시간에 따라 insert가능
		String status = "";
		if (time < 6) {
			message = "6시 이후부터 출근이 가능합니다";
			model.addAttribute("message", message);
			return "main";
		} else if (time < 9) {
			status = "출근";
		} else if (9 <= time && time < 18) {
			status = "지각";
		} else if (time > 18) {
			message = "근무시간이 지났습니다.";
			model.addAttribute("message", message);
			return "main";
		}

		int result = attendanceService.insertAttendance(empId, status);
		log.info(message);
		return "main";
	}

	/**
	 * 퇴근버튼 눌렀을 때, attendance의 퇴근 update
	 * 
	 * @author LEEYEONHEE
	 * @param session
	 * @param response
	 * @throws IOException
	 */
	@GetMapping("/attendance/clockout")
	public String leave(HttpSession session, Model model) {
		log.info("실행");
		// 1. 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		String message = "";
		// 2. 오늘날짜 생성
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH");
		int time = Integer.parseInt(simpleDateFormat.format(date));
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YY.MM.dd");
		String today = simpleDateFormat1.format(date);

		// 1) 출근 상태 확인하기
		String todayStatus = attendanceService.getThisWeekStatus(today, empId);
		if (todayStatus == null) {
			message = "출근하지 않았습니다.";
			model.addAttribute("message", message);
			return "main";
		} else if (todayStatus.contains("오후반차")) {
			if (time > 13) {
				int result = attendanceService.updateLeave(today, empId);
				return "main";
			} else {
				message = "14시 이후부터 퇴근이 가능합니다.";
				model.addAttribute("message", message);
				return "main";
			}
		}
		if (time < 18) {
			message = "18시 이후부터 퇴근이 가능합니다.";
			model.addAttribute("message", message);
			return "main";
		}

		// 3. 퇴근 시간 update
		int result = attendanceService.updateLeave(today, empId);

		return "main";
	}

	/**
	 * 근태 관리 눌렀을 때, 나오는 초기 화면
	 * 
	 * @author LEEYEONHEE
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/attendance/info")
	public String attendanceStatusInfo(Model model, HttpSession session) {

		log.info("실행");

		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();

		// =========================<주 근무 현황>============================
		// 현재시간 생성
		Date date = new Date();

		// =========================<월 근무 통계>=============================
		// 이번달
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("YY.MM");
		String month = simpleDateFormat2.format(date);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YY.MM.dd");
		String today = simpleDateFormat.format(date);
		
		AttendanceMonthStatus attendanceMonthStatus = attendanceService.getMonthCount(empId,month);
		log.info(attendanceMonthStatus);
		model.addAttribute("attendanceMonthStatus",attendanceMonthStatus);
		// =========================<주중 근무 현황>============================
		
		// 이번주 날짜 list
		Holiday h = new Holiday();
		List<String> list = h.getCurMonday();
		String title = list.get(0) + " ~ " + list.get(6);

		// 이번주 status list
		List<Integer> attendanceTime = new ArrayList<>();
		List<Integer> lateTime = new ArrayList<>();
		List<Integer> overTime = new ArrayList<>();
		for (String i : list) {
			String status = attendanceService.getThisWeekStatus(i, empId);
			if (status != null) {
				if (status.equals("출근")) {
					attendanceTime.add(8);
					lateTime.add(0);
					overTime.add(0);
				} else if (status.contains("지각")) {
					int late = attendanceService.getlateTime(i, empId);
					log.info(late);
					attendanceTime.add(8-late);
					lateTime.add(late);
					overTime.add(0);
				} else if (status.contains("반차")) {
					attendanceTime.add(4);
					lateTime.add(0);
					overTime.add(0);
				} else if (status.equals("연장근무")) {
					attendanceTime.add(8);
					lateTime.add(0);
					overTime.add(2);
				}
			} else {
				attendanceTime.add(0);
				lateTime.add(0);
				overTime.add(0);
			}

		}
		log.info(attendanceTime);
		// 이번주 날짜와 이번주 status를 model에 저장
		model.addAttribute("attendanceTime", attendanceTime);
		model.addAttribute("halfTime", lateTime);
		model.addAttribute("overTime", overTime);
		model.addAttribute("title", title);
		return "attendance/attendance_info";
	}

	/**
	 * 월별 근무 현황(달력)
	 * 
	 * @author LEEYEONHEE
	 * @param session
	 * @return
	 */
	@GetMapping("/attendance/mystatus")
	@ResponseBody
	public List<Map<String, String>> attendanceStatus(HttpSession session) {
		log.info("실행");
		// =========================<공휴일>============================
		// 올해 년도
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYY");
		String today = simpleDateFormat1.format(date);
		List<Map<String, String>> answer = new ArrayList<Map<String, String>>();
		/*
		 * // 올해 공휴일 list Holiday holiday = new Holiday(); List<String> dates =
		 * holiday.holidayArray(today);
		 * 
		 * //fullCalendar에 출력을 위해 List에 담아준다.
		 * 
		 * for (String d : dates) { HashMap<String, String> hash = new HashMap<String,
		 * String>(); hash.put("title", "공휴일"); hash.put("start", d);
		 * hash.put("backgroundColor", "#DA5454"); hash.put("borderColor", "#DA5454");
		 * answer.add(hash); }
		 */

		// =========================<사원의 출근 정보>============================
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();

		// 사원의 모든 출근 정보 list
		List<Attendance> attendance = attendanceService.getTotalAtt(empId);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		// 1번째 줄에 출근 시간과 status
		for (Attendance a : attendance) {
			HashMap<String, String> hash = new HashMap<String, String>();

			if (a.getClockIn() == null) {
				hash.put("title", a.getStatus());
				hash.put("start", format.format(a.getAttendanceDate()));
				if (a.getStatus().equals("결근")) {
					hash.put("backgroundColor", "#808080");
					hash.put("borderColor", "#808080");
				} else if (a.getStatus().contains("경조사") || a.getStatus().contains("반차")||a.getStatus().contains("연차")) {
					hash.put("backgroundColor", "#66BB6A");
					hash.put("borderColor", "66BB6A");
				}
			} else {
				hash.put("title", a.getClockIn().substring(0, 2) + "시" + a.getClockIn().substring(3) + "분");
				hash.put("start", format.format(a.getAttendanceDate()));

				if (a.getStatus().equals("출근")) {
					hash.put("backgroundColor", "#4DABF7");
					hash.put("borderColor", "#49a3f1");
				} else if (a.getStatus().equals("지각")) {
					hash.put("backgroundColor", "#ffc107");
					hash.put("borderColor", "#ffc107");
				}	else if (a.getStatus().equals("연장근무")) {
					hash.put("backgroundColor", "#6f42c1");
					hash.put("borderColor", "#6f42c1");
				}

			}
			answer.add(hash);
		}

		// 2번째 줄에 퇴근시간
		for (Attendance a : attendance) {
			HashMap<String, String> hash = new HashMap<String, String>();
			if (a.getClockOut() != null) {
				hash.put("title", a.getClockOut().substring(0, 2) + "시" + a.getClockOut().substring(3) + "분");
				hash.put("start", format.format(a.getAttendanceDate()));
				if (a.getStatus().equals("출근")) {
					hash.put("backgroundColor", "#4DABF7");
					hash.put("borderColor", "#49a3f1");
				} else if (a.getStatus().equals("지각")) {
					hash.put("backgroundColor", "#ffc107");
					hash.put("borderColor", "#ffc107");
				} else if (a.getStatus().equals("연장근무")) {
					hash.put("backgroundColor", "#6f42c1");
					hash.put("borderColor", "#6f42c1");
				}
				answer.add(hash);
			}

		}

		// 공휴일과 사원 출근 정보를 모두 담은 list를 리턴
		return answer;
	}

	@GetMapping("/holiday")
	@ResponseBody
	public boolean holidays(String today) {
		log.info("실행");
		Holiday holiday = new Holiday();
		boolean isholi = holiday.isHoliday(today);
		return isholi;
	}

	@GetMapping("/statuslist")
	@ResponseBody
	public List<String> statusList(int month, HttpSession session) {
		log.info("실행");
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		List<String> list = attendanceService.getAttStatus(empId, month);
		log.info(list);
		return list;
	}

	/*
	 * @GetMapping("/attendance/dept") public String deptList() { log.info("실행");
	 * 
	 * return "attendance/dept_attendance_info"; }
	 */

	@GetMapping("/attendance/write")
	public String deptList() {
		log.info("실행");

		return "attendance/attendance_writeform";
	}
	
	@GetMapping("/attendance/list/{type}")
	public String attList(@PathVariable int type, @RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(value = "status", defaultValue = "") String status, Model model, HttpSession session) {
	
		log.info("실행");

		return "attendance/attendance_list";
	}
	
	@GetMapping("/attendance/datail/{type}")
	public String attDetail(@PathVariable int type, @RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(value = "status", defaultValue = "") String status, Model model, HttpSession session) {
	
		log.info("실행");

		return "attendance/attendance_detail";
	}
}
