package com.mycompany.webapp.vacation.service;

import java.util.List;

import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationLine;
import com.mycompany.webapp.vacation.model.VacationList;

public interface IVacationService {

	VacationLine getVacationLine(String empId);

	int writeVacation(Vacation vacation);

	List<VacationList> getVacationList(String empId);

}
