package com.mycompany.webapp.attendance.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public Attendance attendanceToday(HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMdd");
		String attDate = simpleDateFormat1.format(date);
		Attendance attendance = attendanceService.getAttendance(attDate, empId);
		if(attendance != null) {
			if(attendance.getClockIn() == null) {
				if(attendance.getStatus().contains("반차")) {
					attendance.setClockIn("-- : -- : --");
					attendance.setClockOut("-- : -- : --");
					attendance.setIsIn("n");
					attendance.setIsOut("n");
				}else {
					attendance.setClockIn("-- : -- : --");
					attendance.setClockOut("-- : -- : --");
					attendance.setIsIn("y");
					attendance.setIsOut("y");
				}
			}else {
				if(attendance.getClockOut() == null) {
					attendance.setClockOut("-- : -- : --");
					attendance.setIsIn("y");
					attendance.setIsOut("n");
				}else {
					attendance.setIsIn("y");
					attendance.setIsOut("y");
				}
			}
		}
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

	@RequestMapping(value = "/attendance/clockin", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String clockIn(@RequestParam String status, Model model, HttpSession session) {
		log.info("실행");
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYYMMdd");
		String attDate = simpleDateFormat.format(date);
		
		Calendar cal = Calendar.getInstance();
		int day =  cal.get(Calendar.DAY_OF_WEEK);
		Holiday holiday = new Holiday();
		boolean type = holiday.isHoliday(attDate);
		 if(day == 1 || day == 7 || type) {
			 return "휴무입니다.";
		 }
		
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		Attendance attendance = attendanceService.getAttendance(attDate, empId);
		if(attendance != null) {
			if(attendance.getStatus().contains("반차")) {
				attendanceService.attClockInUpdate(attendance.getAttendanceId());
				return "success";
			}else {
				return "이미 출근하셨거나 휴가상태입니다.";
			}
		}
		attendanceService.insertAttendance(empId, status);
		return "success";
	}

	/**
	 * 퇴근버튼 눌렀을 때, attendance의 퇴근 update
	 * 
	 * @author LEEYEONHEE
	 * @param session
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/attendance/clockout", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String clockout(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMdd");
		String attDate = simpleDateFormat1.format(date);
		Attendance attendance = attendanceService.getAttendance(attDate, empId);

		if(attendance == null) {
			return "출근하지 않으셨습니다.";
		}else {
			attendanceService.attClockOutUpdate(attendance.getAttendanceId());
		}
		
		return "success";
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
	public String attendanceInfo(Model model, HttpSession session) {
		log.info("실행");
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		// =========================<월 근무 통계>=============================
		Date date = new Date();
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("YY.MM");
		String month = simpleDateFormat2.format(date);
		AttendanceMonthStatus attendanceMonthStatus = attendanceService.getMonthCount(empId,month);
		model.addAttribute("attendanceMonthStatus",attendanceMonthStatus);
		// =========================<주중 근무 현황>============================
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
					if(late<4) {
						attendanceTime.add(8-late);
						lateTime.add(late);
						overTime.add(0);
					}else {
						attendanceTime.add(8-late-1);
						lateTime.add(late-1);
						overTime.add(0);
					}
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
		model.addAttribute("attendanceTime", attendanceTime);
		model.addAttribute("halfTime", lateTime);
		model.addAttribute("overTime", overTime);
		model.addAttribute("title", title);
		return "attendance/attendance_info";
	}
	/**
	 * 나의 근무 현황(달력)
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
				}	else if (a.getStatus().contains("반차")) {
					hash.put("backgroundColor", "#66BB6A");
					hash.put("borderColor", "#66BB6A");
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
	public List<String> statusList(@RequestParam String startDay,@RequestParam String endDay, HttpSession session) {
		log.info("실행");
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		List<String> list = attendanceService.getAttStatus(empId, startDay,endDay);
		return list;
	}


	
}
