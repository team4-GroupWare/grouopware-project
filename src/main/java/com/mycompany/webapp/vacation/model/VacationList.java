package com.mycompany.webapp.vacation.model;

import java.util.Date;

import lombok.Data;

@Data
public class VacationList {
	private int vacationId;
	private String name;
	private String vacationName;
	private int countDay;
	private String startDate;
	private String endDate;
	private String status;
	private String empId;
}
