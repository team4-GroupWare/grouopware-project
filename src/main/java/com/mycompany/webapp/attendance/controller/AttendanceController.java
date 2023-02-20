package com.mycompany.webapp.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

public class AttendanceController {
	public static void main(String[] args) {
		Date date1 = new Date();
		System.out.println(date1);
		
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMdd");
		
		String attDate = simpleDateFormat1.format(date1);
		System.out.println(attDate);
		
	}
}
