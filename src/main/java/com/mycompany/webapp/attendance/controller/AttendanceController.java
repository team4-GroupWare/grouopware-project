package com.mycompany.webapp.attendance.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.service.IAttendanceService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2

public class AttendanceController {
	
	@Autowired
	IAttendanceService attendanceService;
	
	@GetMapping("/attendanceinfo")
	@ResponseBody
	public Attendance attendance(Attendance attendance, HttpSession session,HttpServletResponse response ,Model model) throws IOException{
		
		log.info("실행");
		//로그인한 사원의 ID
		String empId = "yeoni";
		//오늘의 날짜
		Date date = new Date();
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMDD");
		String attDate = simpleDateFormat1.format(date);
		//로그인한 사원의 오늘의 출결 정보 가져오기
		attendance = attendanceService.getAttendance(attDate,empId);
		log.info(attendance);
		
		return attendance;
	}
	
}
