package com.mycompany.webapp.employee.model;

import java.sql.Date; 

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Employee {
	private String empId;
	private String managerId;
	private int deptId;
	private int teamId;
	private int gradeId;
	private int empNo;
	private String password;
	private String name;
	private String phone;
	private Date birth;
	private Date hireDate;
	private Date resignDate;
	private String profileContentType;
	private byte[] profileData;
	private int dayoffRemain;
	private int addDayoffRemain;
	private boolean initialPassword;
	private MultipartFile attachFiles;
	private String delete;
	private String teamName;
	private String deptName;
	private String gradeName;
	
	private String type;
	private String keyword;
}
