package com.mycompany.webapp.approval.model;

import java.sql.Blob;

import lombok.Data;
@Data
public class ApprovalFile {
	private int approvalFileId;
	private int approvalId;
	private String approvalFileName;
	private String approvalFileSize;
	private String approvalFileContentType;
	private Blob approvalFileDate;
	
}
