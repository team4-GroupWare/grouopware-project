package com.mycompany.webapp.vacation.service;

import java.util.List;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDate;
import com.mycompany.webapp.vacation.model.VacationDetail;
import com.mycompany.webapp.vacation.model.VacationLine;
import com.mycompany.webapp.vacation.model.VacationList;

public interface IVacationService {

	int writeVacation(Vacation vacation);

	VacationDetail getVacationDetail(int vacationId);

	List<VacationDate> getVacationDate(int vacationId);

	Vacation getApprovalEmp(String empId);

	int getVacationRow(int listType, String empId, String status);

	List<VacationList> getVacationList(Pager pager, String empId, String status, int listType);

	Employee getVacationDays(String empId, int listType);

}
