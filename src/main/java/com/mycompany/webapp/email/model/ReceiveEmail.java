package com.mycompany.webapp.email.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReceiveEmail {
	private int receiveEmailId;
	private String sentEmpId;
	private Date readDate;
	private int emailContentId;
	private boolean isDeleted;
	private Date trashDate;
}
