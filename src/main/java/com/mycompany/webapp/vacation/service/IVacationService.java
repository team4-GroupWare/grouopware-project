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
	
	//나의 휴가 list
	int getVacationRow(String empId, String status, int type);
	List<VacationList> getVacationList(Pager pager, String empId, String status, int type);
	Employee getVacationDays(String empId);
	
	//나의 휴가 detail
	VacationDetail getVacationDetail(int vacationId);
	Vacation getApprovalEmp(String empId);
	List<VacationDate> getVacationDate(int vacationId);
	
	//연차 정보 가져오
	int getEmpDayOff(int vacationCategoryId, String empId);

	int processVacation(String type, int vacationId, List<VacationDate> vacationDate, String vacationName,
			String empId);

	int processVacation(String type, int vacationId, List<VacationDate> vacationDate, String vacationName, String empId,
			int vacationCategoryId);


}
