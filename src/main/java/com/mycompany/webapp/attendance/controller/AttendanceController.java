package com.mycompany.webapp.attendance.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
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

	@GetMapping("/attendanceinfo")
	@ResponseBody
	public Attendance attendanceInfo(Attendance attendance, HttpSession session, HttpServletResponse response,
			Model model) throws IOException {
		log.info("실행");
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		// 오늘의 날짜
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMdd");
		String attDate = simpleDateFormat1.format(date);
		log.info(empId);
		log.info(attDate);
		// 로그인한 사원의 오늘의 출결 정보 가져오기
		attendance = attendanceService.getAttendance(attDate, empId);
		log.info(attendance);

		return attendance;
	}

	@GetMapping("/attendance")
	@ResponseBody
	public void attendance(Attendance attendance, HttpSession session, HttpServletResponse response, Model model)
			throws IOException {
		log.info("실행");
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();
		attendance.setEmpId(empId);
		// 현재시간 생성
		Date date = new Date();
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("HH");
		int time = Integer.parseInt(simpleDateFormat2.format(date));

		// 시간에 따른 status attendance에 추가
		// 1) 반차를 쓰지 않았을 경우
		if (time <= 8) {
			// 8시 전에 출근을 눌렀을 때
			attendance.setStatus("출근");

		} else if (8 < time && time < 18) {
			// 9시 이후 ~ 18시이전에 출근을 눌렀을 때
			attendance.setStatus("지각");
		}
		log.info(attendance);
		// 출근 행 넣어줌
		int result = attendanceService.insertAttendance(attendance);
		// status
		JSONObject jsonobject = new JSONObject();
		jsonobject.put("status", attendance.getStatus());
		String json = jsonobject.toString();

		response.setContentType("application/json; charset=UTF-8");

		PrintWriter pw = response.getWriter();
		pw.println(json);
		pw.flush();
		pw.close();

	}

	@GetMapping("/leave")
	
	public void leave(HttpSession session, HttpServletResponse response) throws IOException {
		log.info("실행");
		// 로그인한 사원의 ID
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		String empId = employee.getEmpId();

		// 오늘날짜 생성
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMdd");
		String attDate = simpleDateFormat1.format(date);

		int result = attendanceService.updateLeave(attDate, empId);

		JSONObject jsonobject = new JSONObject();
		jsonobject.put("message", "성공");
		String json = jsonobject.toString();

		response.setContentType("application/json; charset=UTF-8");

		PrintWriter pw = response.getWriter();
		pw.println(json);
		pw.flush();
		pw.close();

	}
	
	@GetMapping("/attendance/status/info")
	public String attendanceStatusInfo() {
		log.info("실행");
		return "attendance/attendance_status";
	}
	//List<Map<String,String>>
	@GetMapping("/attendance/status")
	@ResponseBody
	public List<Map<String, String>> attendanceStatus() {
		// 올해 년도
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYY");
		String today = simpleDateFormat1.format(date);
		// 공휴일
		Holiday holiday = new Holiday();
		List<String> dates = holiday.holidayArray(today);
		log.info(dates);
		
		//HashMap<String, String> hash = new HashMap<String, String>();
		List<Map<String,String>> answer = new ArrayList<Map<String,String>>();
		
		for (String d : dates) {
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", "공휴일");
			hash.put("start", d);
			hash.put("backgroundColor", "#DA5454");
			hash.put("borderColor", "#DA5454");
			
			log.info("해시"+hash.toString());
			
			answer.add(hash);
			log.info("담는 리스트"+answer);
		}
		log.info("최종결과"+answer);
		

		return answer;
	}
}
