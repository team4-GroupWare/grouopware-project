package com.mycompany.webapp.email.model;

import java.sql.Date;

import lombok.Data;

@Data
public class EmailList {
	private String sentId;
	private String receiveId;
	private Date readDate;
	private String title;
	private int contentId;
	private Date sentDate;

}
