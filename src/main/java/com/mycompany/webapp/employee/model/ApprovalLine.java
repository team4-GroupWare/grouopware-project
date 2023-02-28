package com.mycompany.webapp.employee.model;

import lombok.Data;

@Data
public class ApprovalLine {
	private String empId;
	private String name;
	private int deptId;
	private int teamId;
	private int gradeId;
	private String managerId;
	
	private String teamName;
	private String deptName;
	private String gradeName;
	
	private int seq;
}
