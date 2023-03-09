package com.mycompany.webapp.employee.model;

import lombok.Data;

@Data
public class EmployeePassword {
	private String newPwd;
	private String oldPwd;
	private String empId;

}
