package com.mycompany.webapp.email.model;

import java.sql.Date;

import lombok.Data;

@Data
//임시보관함
public class TempEmail {
	private int tempEmailId;
	private String receiveId;
	private Date tempDate;
	private String content;
	private String title;
	private String sentId;
	private Boolean important;
	private int emailContentId;
	

}
