package com.mycompany.webapp.attendance.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Attendance {
	private int attendanceId;
	private String empId;
	private String clockIn;
	private String clockOut;
	private Date attendanceDate;
	private String status;
	private String isIn;
	private String isOut;
}
