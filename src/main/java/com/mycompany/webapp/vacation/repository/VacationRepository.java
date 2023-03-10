package com.mycompany.webapp.vacation.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDate;
import com.mycompany.webapp.vacation.model.VacationDetail;
import com.mycompany.webapp.vacation.model.VacationLine;
import com.mycompany.webapp.vacation.model.VacationList;

@Repository
public interface VacationRepository {

	public int insertVacation(Vacation vacation);

	public int insertVacationLine(VacationLine vacationLine);

	public int insertVacationDate(VacationDate vacationDate);


	public int selectVacationCount(@Param("empId") String empId, @Param("status") String status);

	public List<VacationList> selectVacationList(@Param("pager") Pager pager, @Param("empId") String empId, @Param("status") String status);

	public Employee selectVacationDays(String empId);

	public VacationDetail selectVacationDetail(int vacationId);

	public List<VacationDate> selectVacationDate(int vacationId);

	public Vacation selectApprovalEmp(String empId);

}
