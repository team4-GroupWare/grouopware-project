package com.mycompany.webapp.vacation.service;

import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationLine;

public interface IVacationService {

	VacationLine getVacationLine(String empId);

	int writeVacation(Vacation vacation);

}
