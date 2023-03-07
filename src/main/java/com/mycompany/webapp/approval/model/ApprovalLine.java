package com.mycompany.webapp.approval.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ApprovalLine {

	private int approvalLineId;
	private int approvalId;
	private String empId;
	private int seq;
	private String isApproved;
	private String approvalComment;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date approvalDate;
	
	private String empName;
	private String teamName;
	private String deptName;
	private String gradeName;
}
