package com.mycompany.webapp.attendance.model;

import lombok.Data;

@Data
public class AttendanceMonthStatus {
	private int attCount;
	private int lateCount;
	private int absentCoutn;
	private int halfCount;
	private int eventCount;
	private int overTime;
}
