package com.mycompany.webapp.email.model;

import java.sql.Date;

import lombok.Data;

@Data
public class SendEmail {
	private int sentEmailId;
	private String receiveEmpId;
	private Date sentDate;
	private int emailContentId;
	private boolean isDeleted;
	private Date trashDate;
	private int emailFileId;
	private String emailFileName;
	private int emailFileSize;
}
