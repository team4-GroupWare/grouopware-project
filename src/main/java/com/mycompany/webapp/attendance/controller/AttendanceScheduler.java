package com.mycompany.webapp.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mycompany.webapp.attendance.service.IAttendanceService;

@Component
public class AttendanceScheduler {
	@Autowired
	IAttendanceService attendanceService;

	//@Scheduled(cron = "0 00 18 * * 1-7") 18시에 추가
	// 23시 59분에 결근으로 학생 추가
	
	@Scheduled(cron = "30 13 12 * * 1-5")
	public void getStudentStatus2() {
		//Date date = new Date();
		
		Calendar c1 = new GregorianCalendar();
		c1.add(Calendar.DATE, -1); 
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

		String today = format.format(c1.getTime());
		System.out.println(today);

		attendanceService.addEmpAtt(today);
	}

}
