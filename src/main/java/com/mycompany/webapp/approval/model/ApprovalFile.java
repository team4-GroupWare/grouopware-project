package com.mycompany.webapp.approval.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="approvalFileData")
public class ApprovalFile {
	private int approvalFileId;
	private int approvalId;
	private String approvalFileName;
	private long approvalFileSize;
	private String approvalFileContentType;
	private byte[] approvalFileData;
	
}
