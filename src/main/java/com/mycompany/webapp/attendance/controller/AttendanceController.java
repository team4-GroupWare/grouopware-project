package com.mycompany.webapp.attendance.controller;

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
import com.mycompany.webapp.employee.service.IEmployeeService;
import com.mycompany.webapp.overtime.service.IOvertimeService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class AttendanceController {
	@Autowired
	IAttendanceService attendanceService;
	
	@Autowired
	IOvertimeService overtimeService;
	
	@Autowired
	IEmployeeService employeeService;
	
	/**
	 * 사원의 오늘날짜 출근기록 조회
	 * @author : LEEYENOHEE
	 * @return : 사원의 출근 정보
	 */
	@GetMapping("attendance/main")
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
				if(attendance.getClockOut() == null && !attendance.getStatus().equals("퇴근미처리")) {
					attendance.setClockOut("-- : -- : --");
					attendance.setIsIn("y");
					attendance.setIsOut("n");
				}else if(attendance.getClockOut() == null && attendance.getStatus().equals("퇴근미처리")) {
					attendance.setClockOut("-- : -- : --");
					attendance.setIsIn("y");
					attendance.setIsOut("y");
				}else {
					attendance.setIsIn("y");
					attendance.setIsOut("y");
				}
			}
		}
		return attendance;
	}
	
	/**
	 * 사원의 이번달 출근 상태 달력 조회
	 * @param startDay : 이번달의 시작일
	 * @param endDay : 이번달의 마지막일
	 * @author : LEEYENOHEE
	 * @return : 이번달의 출근 상태 LIST
	 */
	@GetMapping("/statuslist")
	@ResponseBody
	public List<String> statusList(@RequestParam String startDay,@RequestParam String endDay, HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		List<String> list = attendanceService.getAttStatus(empId, startDay,endDay);
		return list;
	}
	
	/**
	 * 출근버튼 클릭
	 * @param status : 현재시간 기준으로 출근 or 지각
	 * @author : LEEYENOHEE
	 * @return : 성공  or 실패 message
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
	 * 퇴근버튼 클릭
	 * @author : LEEYENOHEE
	 * @return : 성공  or 실패 message
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
	 * 근무 현황 페이지 
	 * @author : LEEYENOHEE
	 * @return : attendance/attendance_info
	 */
	@GetMapping("/attendance/info")
	public String attendanceInfo(Model model,HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empIdorigine = employee.getEmpId();
		Employee updateEmp = employeeService.getEmp(empIdorigine);
		session.setAttribute("loginEmployee", updateEmp);
		Holiday h = new Holiday();
		List<String> list = h.getCurMonday();
		String title = list.get(0) + " ~ " + list.get(6);
		model.addAttribute("title", title);
		
		return "attendance/attendance_info";
	}
	
	/**
	 * 주 근무 현황
	 * @author : LEEYENOHEE
	 * @return : 요일별 출근, 지각, 연장근무의 시간 LIST
	 */
	@GetMapping("/attendance/week")
	@ResponseBody
	public List<List<Integer>> attendanceWeekInfo(Model model, HttpSession session) {
		log.info("실행");
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		Holiday h = new Holiday();
		List<String> list = h.getCurMonday();
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
						attendanceTime.add(8-late+1);
						lateTime.add(late-1);
						overTime.add(0);
					}
				}  else if (status.equals("연장근무")) {
					int late = attendanceService.getlateTime(i, empId);
					int worktime = overtimeService.getworktime(i, empId);
					if(late<4) {
						attendanceTime.add(8-late);
						lateTime.add(late);
						overTime.add(worktime);
					}else {
						attendanceTime.add(8-late-1);
						lateTime.add(late-1);
						overTime.add(worktime);
					}
				}else if (status.contains("반차")) {
					attendanceTime.add(4);
					lateTime.add(0);
					overTime.add(0);
				}else {
					attendanceTime.add(0);
					lateTime.add(0);
					overTime.add(0);
				}
			} else {
				attendanceTime.add(0);
				lateTime.add(0);
				overTime.add(0);
			}
		}
		List<List<Integer>> weeks = new ArrayList<>();
		weeks.add(attendanceTime);
		weeks.add(lateTime);
		weeks.add(overTime);
		
		return weeks;
	} 
	/**
	 * 월 근무 통계
	 * @author : LEEYENOHEE
	 * @return : 출근, 휴가, 지각, 결근, 연장, 퇴근미처리일수가 담긴 attendanceMonthStatus VO
	 */
	@GetMapping("/attendance/statistics")
	@ResponseBody
	public AttendanceMonthStatus attendanceStatistics(Model model, HttpSession session) {
		log.info("실행");
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		Date date = new Date();
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("YY.MM");
		String month = simpleDateFormat2.format(date);
		AttendanceMonthStatus attendanceMonthStatus = attendanceService.getMonthCount(empId,month);
		log.info(attendanceMonthStatus);
		
		
		return attendanceMonthStatus;
	}
		
	/**
	 * 나의 근무 현황
	 * @author : LEEYENOHEE
	 * @return : Full calendar를 위해 데이터 가공 List 
	 */
	@GetMapping("/attendance/mystatus")
	@ResponseBody
	public List<Map<String, String>> attendanceStatus(HttpSession session) {
		log.info("실행");
		List<Map<String, String>> answer = new ArrayList<Map<String, String>>();
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		List<Attendance> attendance = attendanceService.getTotalAtt(empId);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// 1번째 줄에 출근 시간과 status
		for (Attendance a : attendance) {
			HashMap<String, String> hash = new HashMap<String, String>();
			if (a.getClockIn() == null) {
				hash.put("title", a.getStatus());
				hash.put("start", format.format(a.getAttendanceDate()));
				if (a.getStatus().equals("결근")) {
					hash.put("backgroundColor", "#be5683");
					hash.put("borderColor", "#be5683");
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
				}	else if (a.getStatus().contains("오전반차")) {
					hash.put("backgroundColor", "#66BB6A");
					hash.put("borderColor", "#66BB6A");
				}	else if (a.getStatus().contains("퇴근미처리")) {
					hash.put("backgroundColor", "#113f83");
					hash.put("borderColor", "#113f83");
				}	else if (a.getStatus().contains("오후반차")) {
					hash.put("backgroundColor", "#4DABF7");
					hash.put("borderColor", "#4DABF7");
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
				}else if (a.getStatus().contains("오전반차")) {
					hash.put("backgroundColor", "#4DABF7");
					hash.put("borderColor", "#4DABF7");
				}else if (a.getStatus().contains("오후반차")) {
					hash.put("backgroundColor", "#66BB6A");
					hash.put("borderColor", "#66BB6A");
				}
				answer.add(hash);
			}

		}
		return answer;
	}

	/**
	 * 공휴일 유무 판단
	 * @author : LEEYENOHEE
	 * @return : 
	 */
	@GetMapping("/holiday")
	@ResponseBody
	public boolean holidays(String today) {
		log.info("실행");
		Holiday holiday = new Holiday();
		boolean isholi = holiday.isHoliday(today);
		return isholi;
	}

}
