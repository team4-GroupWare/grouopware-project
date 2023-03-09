package com.mycompany.webapp.email.model;

import java.sql.Date;

import lombok.Data;

@Data
public class MainEmailList {
	private String sentId;
	private String sentName;
	private String receiveId;
	private String receiveName;
	private String title;
	private Date sentDate;
	private boolean important;
	private int sendEmailId;
	private int receiveEmailId;
	private String sendProfileContentType;
	private byte[] sendProfileData;
	private String receiveProfileContentType;
	private byte[] receiveProfileData;
}
