package com.mycompany.webapp.vacation.model;

import java.util.Date;

import lombok.Data;

@Data
public class VacationDate {
	private int vacationDateId;
	private Date startDate;
	private Date endDate;
	private int vacationId;
	
	private String startDateStr;
	private String endDateStr;
}
