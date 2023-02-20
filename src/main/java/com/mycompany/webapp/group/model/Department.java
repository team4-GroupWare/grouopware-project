package com.mycompany.webapp.group.model;

import java.util.List;

import lombok.Data;

@Data
public class Department {
	private int deptId;
	private String deptName;
	private String empId;
	
	private List<Team> teams;
}
