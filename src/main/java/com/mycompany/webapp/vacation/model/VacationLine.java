package com.mycompany.webapp.vacation.model;

import lombok.Data;

@Data
public class VacationLine {
	private int vacationLineId;
	private int vacationId;
	private String empId;
}
