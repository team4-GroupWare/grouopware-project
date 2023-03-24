package com.mycompany.webapp.component;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mycompany.webapp.attendance.service.IAttendanceService;

@Component
public class AttendanceScheduler {
	@Autowired
	IAttendanceService attendanceService;

	// 23시 59분에 퇴근/결근 넣어주기
	//@Scheduled(cron = "30 59 23 * * 1-5")
	public void addAtt18() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String today = format.format(date); 
		attendanceService.addEmpAtt(today);
	}
}
