package com.mycompany.webapp.component;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	// 오늘을 기준으로 attendance 행 넣어주는 것
	// 플젝 끝나고 지울것
	//@Scheduled(cron = "40 12 16 * * *")
	public void addThisWeek() {
/*
		Date date = new Date();
		Calendar c1 = new GregorianCalendar();
		c1.add(Calendar.DATE, -1);
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String today = format.format(c1.getTime()); // c1.getTime()
*/		List<String> a = new ArrayList<String>();
		/*a.add("20230227");
		a.add("20230228");
		a.add("20230302");
		a.add("20230303");
		a.add("20230306");
		a.add("20230307");
		a.add("20230308");
		a.add("20230309");*/
		a.add("20230310");
		a.add("20230313");
		a.add("20230314");
		a.add("20230315");
		a.add("20230316");
		a.add("20230317");
		for(String today:a) {
			attendanceService.ThisWeek(today);
		}

	}

}
