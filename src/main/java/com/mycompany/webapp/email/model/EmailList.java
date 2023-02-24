package com.mycompany.webapp.email.model;

import java.sql.Date;

import lombok.Data;

@Data
public class EmailList {
	String sentId;
	String title;
	Date sentDate;

}
