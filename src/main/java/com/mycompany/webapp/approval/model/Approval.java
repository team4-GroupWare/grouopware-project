package com.mycompany.webapp.approval.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Approval {
	private int approvalId;
	private Date writeDate;
	private String content;
	private String empId;
	private int approvalCategoryId;
	private String status;
	private boolean tempApproval;
	private String type;
}
