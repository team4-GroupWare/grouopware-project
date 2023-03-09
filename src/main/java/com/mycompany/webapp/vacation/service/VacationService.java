package com.mycompany.webapp.vacation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.vacation.model.Vacation;
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
	public VacationLine getVacationLine(String empId) {
		log.info("실행");
		return vacationRepository.selectVacationLine(empId);
	}

	@Override
	@Transactional
	public int writeVacation(Vacation vacation) {
		log.info("실행");
		vacationRepository.insertVacation(vacation);
		
		for(int i = 0; i < vacation.getVacationLine().size(); i++) {
			vacationRepository.insertVacationLine(vacation.getVacationLine().get(i));
		}
		
		for(int i = 0; i < vacation.getVacationDate().size(); i++) {
			vacationRepository.insertVacationDate(vacation.getVacationDate().get(i));
		}
		
		return 2;
	}

	@Override
	public List<VacationList> getVacationList(String empId) {
		log.info("실행");
		return vacationRepository.selectVacationList(empId);
	}

}
