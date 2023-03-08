package com.mycompany.webapp.vacation.repository;

import org.springframework.stereotype.Repository;

import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDate;
import com.mycompany.webapp.vacation.model.VacationLine;

@Repository
public interface VacationRepository {

	public VacationLine selectVacationLine(String empId);

	public int insertVacation(Vacation vacation);

	public int insertVacationLine(VacationLine vacationLine);

	public int insertVacationDate(VacationDate vacationDate);

}
