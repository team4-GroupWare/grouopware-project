package com.mycompany.webapp.vacation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDate;
import com.mycompany.webapp.vacation.model.VacationDetail;
import com.mycompany.webapp.vacation.model.VacationLine;
import com.mycompany.webapp.vacation.model.VacationList;
import com.mycompany.webapp.vacation.repository.VacationRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class VacationService implements IVacationService {
	@Autowired
	private VacationRepository vacationRepository;
	
	@Override
	public Vacation getApprovalEmp(String empId) {
		log.info("실행");
		return vacationRepository.selectApprovalEmp(empId);
	}

	@Override
	@Transactional
	public int writeVacation(Vacation vacation) {
		log.info("실행");
		int result = vacationRepository.insertVacation(vacation);
		log.info(result);
		for(int i = 0; i < vacation.getVacationDate().size(); i++) {
			vacationRepository.insertVacationDate(vacation.getVacationDate().get(i));
		}
		
		return 2;
	}

	@Override
	public VacationDetail getVacationDetail(int vacationId) {
		log.info("실행");
		return vacationRepository.selectVacationDetail(vacationId);
	}

	@Override
	public List<VacationDate> getVacationDate(int vacationId) {
		log.info("실행");
		return vacationRepository.selectVacationDate(vacationId);
	}

	@Override
	public int getVacationRow(String empId, String status, int type) {
		log.info("실행");
		return vacationRepository.selectVacationCount(empId, status, type);
	}

	@Override
	public List<VacationList> getVacationList(Pager pager, String empId, String status, int type) {
		log.info("실행");
		return vacationRepository.selectVacationList(pager, empId, status, type);
	}

	@Override
	public Employee getVacationDays(String empId) {
		log.info("실행");
		return vacationRepository.selectVacationDays(empId);
	}


}
