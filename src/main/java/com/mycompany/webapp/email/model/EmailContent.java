package com.mycompany.webapp.email.model;

import java.sql.Date;

import lombok.Data;

@Data
public class EmailContent {
	private String sentId;
	private String receiveId;
	private Date readDate;
	private int emailContentId;
	private String title;
	private String content;
	private int originEmailId;
	private boolean important; 
	
}
