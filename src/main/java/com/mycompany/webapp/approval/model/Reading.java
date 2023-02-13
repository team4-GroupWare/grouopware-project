package com.mycompany.webapp.approval.model;
import lombok.Data;

@Data
public class Reading {
	private int readingId;
	private int approvalId;
	private String empId;
}
