package com.mycompany.webapp.vacation.model;

import java.sql.Blob;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="vacationFileData")
public class Vacation {
	private int vacationType;
	private int vacationId;
	private String content;
	private String writeDate;
	private String startDate;
	private String endDate;
	private String dates;
	private int vacationCategoryId;
	private String empId;
	private int countDay;
	
	private String vacationFileName;
	private String vacationFileContentType;
	private Blob vacationFileData;
	private String vacationFileSize;

	private String approvalEmpId; 
	
	private String empName;
	private String gradeName;
	private String teamName;
	private String deptName;
	
	private List<VacationDate> vacationDate;
	private List<VacationLine> vacationLine;
	
}
