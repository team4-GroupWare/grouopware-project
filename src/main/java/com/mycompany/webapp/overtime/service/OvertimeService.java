package com.mycompany.webapp.overtime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.overtime.model.Overtime;
import com.mycompany.webapp.overtime.repository.OvertimeRepository;
import com.mycompany.webapp.vacation.model.VacationDate;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class OvertimeService implements IOvertimeService {
	@Autowired
	private OvertimeRepository overtimeRepository;
	
	
	@Override
	public int writeOvertime(Overtime overtime) {
		return overtimeRepository.insertOvertime(overtime);
	}


	@Override
	public int getOvertimeRow(String empId, String status, int type) {
		log.info("실행");
		return overtimeRepository.selectOvertimeRow(empId, status, type);
	}


	@Override
	public List<Overtime> getOvertimeList(Pager pager, String empId, String status, int type) {
		log.info("실행");
		return overtimeRepository.selectOvertimeList(pager, empId, status, type);
	}


	@Override
	public Overtime getOvertimeDetail(int overtimeId) {
		return overtimeRepository.selectOvertime(overtimeId);
	}


	@Override
	public int getweekOverTime(String sunday,String empId) {
		return overtimeRepository.selecWeekOverTime(sunday,empId);
	}

	@Transactional
	@Override
	public int overTimeProcess(Overtime overtime) {
		log.info("실행");
		
		if (overtime.getType().equals("y")) {
			//attendance 행 업데이트
			overtimeRepository.updateOvertimeAtt(overtime);
			log.info("실행");
		}
		// overtime 행 업데이트
		overtimeRepository.updateOvertime(overtime);
		log.info("실행");

		return 2;
	}

}
