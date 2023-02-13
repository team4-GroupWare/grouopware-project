package com.mycompany.webapp.vacation.model;

import java.sql.Blob;
import java.sql.Date;

import lombok.Data;

@Data
public class Vacation {
	private int vacationId;
	private String content;
	private Date startDate;
	private Date endDate;
	private String type;
	private String empId;
	private String vacationFileName;
	private String vacationFileContentType;
	private Blob vacationFileData;
	private String vacationFileSize;
	
}
