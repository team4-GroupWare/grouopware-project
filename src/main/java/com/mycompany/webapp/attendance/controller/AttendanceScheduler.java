package com.mycompany.webapp.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	
	//@Scheduled(cron = "0 32 15 * * 1-5")
	public void addAtt18() {
		Date date = new Date();
		
		/*Calendar c1 = new GregorianCalendar();
		c1.add(Calendar.DATE, -1); */
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

		String today = format.format(date); //c1.getTime()

		attendanceService.addEmpAtt(today);
	}
	
	//@Scheduled(cron = "20 12 16 * * 1-5")
	public void addThisWeek() {
		Date date = new Date();
		
		/*Calendar c1 = new GregorianCalendar();
		c1.add(Calendar.DATE, -1); */
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

		String today = format.format(date); //c1.getTime()

		attendanceService.ThisWeek(today);
	}

}
