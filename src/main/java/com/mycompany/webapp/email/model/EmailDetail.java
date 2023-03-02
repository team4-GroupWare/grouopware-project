package com.mycompany.webapp.email.model;

import java.util.List;

import lombok.Data;

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
	private List<EmailFile> emailFiles;
	
}
