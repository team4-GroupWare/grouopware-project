package com.mycompany.webapp.approval.model;

import lombok.Data;

@Data
public class ApprovalLine {

	private int approvalLineId;
	private int approvalId;
	private String empId;
	private int seq;
	private boolean isApproved;
	private String comment;
}
