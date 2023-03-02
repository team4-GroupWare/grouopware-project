package com.mycompany.webapp.email.model;

import java.util.List;

import lombok.Data;

@Data
public class EmailDetail {
	private String receiveId;
	private String sendId;
	private String title;
	private String content;
	private boolean important;
	private List<EmailFile> emailFiles;
	
}
