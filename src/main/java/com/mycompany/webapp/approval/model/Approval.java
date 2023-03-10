package com.mycompany.webapp.approval.model;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="approvalFileData")
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
	private String refEmpId;
	
	private String empName;
	private String categoryName;
	
	private String gradeName;
	private String teamName;
	private String deptName;
	 
	private List<ApprovalLine> approvalLine;
	
	//approval 파일
	private MultipartFile[] attachFiles;
	List<ApprovalFile> approvalFiles;
	private int approvalFileId;

	private String approvalFileName;
	private long approvalFileSize;
	private String approvalFileContentType;
	private byte[] approvalFileData;
	
}
