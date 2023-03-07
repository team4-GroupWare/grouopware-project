package com.mycompany.webapp.approval.model;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Approval {
	private int approvalId;
	private String title;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date writeDate;
	private String content;
	private String empId;
	private int approvalCategoryId;
	private String status;
	private String tempApproval;
	
	private String empName;
	private String categoryName;
	
	private String gradeName;
	private String teamName;
	private String deptName;
	 
	private List<ApprovalLine> approvalLine;
	
}
