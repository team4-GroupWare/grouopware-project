package com.mycompany.webapp.vacation.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDate;
import com.mycompany.webapp.vacation.model.VacationLine;
import com.mycompany.webapp.vacation.model.VacationList;

@Repository
public interface VacationRepository {

	public VacationLine selectVacationLine(String empId);

	public int insertVacation(Vacation vacation);

	public int insertVacationLine(VacationLine vacationLine);

	public int insertVacationDate(VacationDate vacationDate);

	public List<VacationList> selectVacationList(String empId);

}
