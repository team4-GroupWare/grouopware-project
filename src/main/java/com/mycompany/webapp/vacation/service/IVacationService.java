package com.mycompany.webapp.vacation.service;

import java.util.List;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDetail;
import com.mycompany.webapp.vacation.model.VacationLine;
import com.mycompany.webapp.vacation.model.VacationList;

public interface IVacationService {

	VacationLine getVacationLine(String empId);

	int writeVacation(Vacation vacation);

	int getVacationRow(String empId, String status);

	List<VacationList> getVacationList(Pager pager, String empId, String status);

	Employee getVacationDays(String empId);

	VacationDetail getVacationDetail(int vacationId);

}
