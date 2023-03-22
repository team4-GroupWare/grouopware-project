package com.mycompany.webapp.overtime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.overtime.model.Overtime;
import com.mycompany.webapp.overtime.repository.OvertimeRepository;

@Service
public class OvertimeService implements IOvertimeService {
	@Autowired
	private OvertimeRepository overtimeRepository;
	
	@Override
	public int writeOvertime(Overtime overtime) {
		return overtimeRepository.insertOvertime(overtime);
	}

	@Override
	public int getOvertimeRow(String empId, String status, int type) {
		return overtimeRepository.selectOvertimeRow(empId, status, type);
	}

	@Override
	public List<Overtime> getOvertimeList(Pager pager, String empId, String status, int type) {
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
		
		if (overtime.getType().equals("y")) {
			//attendance 행 업데이트
			overtimeRepository.updateOvertimeAtt(overtime);
		}
		// overtime 행 업데이트
		overtimeRepository.updateOvertime(overtime);

		return 2;
	}

	@Override
	public int getworktime(String day, String empId) {
		return overtimeRepository.selectworktime(day,empId);
	}

	@Override
	public int deleteOvertime(Overtime overtime) {
		int delete = overtimeRepository.deleteOvertime(overtime);
		return delete;
	}

}
