package com.mycompany.webapp.email.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
public class EmailDetail {
	private int receiveEmailId;
	private int sendEmailId;
	private String receiveId;
	private String receiveName;
	private String receiveGrade;
	private String sendId;
	private String sendName;
	private String sendGrade;
	private String title;
	private String content;
	private boolean important;
	private Date sentDate;
	private Date readDate;
	private Date rtrashDate;
	private Date strashDate;
	private int emailContentId;
	private List<EmailFile> emailFiles;
	private MultipartFile[] attachFiles;
	
}
