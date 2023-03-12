package com.mycompany.webapp.overtime.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Overtime {
	private int overtimeId;
	private String empId;
	private Date writeDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date workDate;
	private int workTime;
	private String status;
	private String content;
	private String approvalEmpId;
	private Date approvalDate;
	private String empName;
	
}
