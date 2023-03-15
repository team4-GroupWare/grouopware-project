package com.mycompany.webapp.component;

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
	
	//18시에 퇴근/결근 넣어주기
	//@Scheduled(cron = "0 51 18 * * 1-5")
	public void addAtt18() {
		Date date = new Date();
		
		/*Calendar c1 = new GregorianCalendar();
		c1.add(Calendar.DATE, -1); */
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

		String today = format.format(date); //c1.getTime()

		attendanceService.addEmpAtt(today);
	}
	
	
	//오늘을 기준으로 attendance 행 넣어주는 것
	//플젝 끝나고 지울것
	//@Scheduled(cron = "25 37 23 * * *")
	public void addThisWeek() {
		Date date = new Date();
		for(int i = -11; i>-12; i--) {
			Calendar c1 = new GregorianCalendar();
		
			c1.add(Calendar.DATE, i); 
			
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	
			String today = format.format(c1.getTime()); //c1.getTime()
			attendanceService.ThisWeek(today);
		}
	}

}
