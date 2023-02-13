package com.mycompany.webapp.email.model;

import lombok.Data;

@Data
public class EmailContent {
	private int emailContentId;
	private String title;
	private String content;
	private int originEmailId;
	private boolean important;
	
}
