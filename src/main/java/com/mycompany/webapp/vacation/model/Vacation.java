package com.mycompany.webapp.vacation.model;

import java.sql.Blob;
import java.util.List;

import com.mycompany.webapp.approval.model.ApprovalLine;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="vacationFileData")
public class Vacation {
	private int vacationId;
	private String content;
	private String writeDate;
	private String type;
	private String empId;
	private String vacationFileName;
	private String vacationFileContentType;
	private Blob vacationFileData;
	private String vacationFileSize;
	
	private List<ApprovalLine> approvalLine;
	
}
