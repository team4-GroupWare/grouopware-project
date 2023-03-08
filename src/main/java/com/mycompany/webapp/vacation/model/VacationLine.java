package com.mycompany.webapp.vacation.model;

import lombok.Data;

@Data
public class VacationLine {
	private int vacationLineId;
	private int vacationId;
	private String empId;
	private int seq;
	private boolean isApproved;
	
	private String empName;
	private String teamName;
	private String deptName;
	private String gradeName;
	
	private int lastSeq;
}
