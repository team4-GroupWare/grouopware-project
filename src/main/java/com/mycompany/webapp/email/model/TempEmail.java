package com.mycompany.webapp.email.model;

import java.sql.Date;

import lombok.Data;

@Data
//임시보관함
public class TempEmail {
	private int tempEmailId;
	private String receiveEmpId;
	private Date tempDate;
	private int emailContentId;
	

}
