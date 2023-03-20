package com.mycompany.webapp.vacation.model;

import java.util.List;

import lombok.Data;

@Data
public class Vacation {
	private int vacationType;
	private int vacationId;
	private String content;
	private String writeDate;
	private String startDate;
	private String endDate;
	private String dates;
	private int vacationCategoryId;
	private String empId;
	private double countDay;
	private String type;
	private String approvalEmpId; 
	private String vacationName;
	private String empName;
	private String gradeName;
	private String teamName;
	private String deptName;
	
	private List<VacationDate> vacationDate;
	
}
