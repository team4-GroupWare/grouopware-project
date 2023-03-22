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
import com.mycompany.webapp.vacation.model.VacationList;
import com.mycompany.webapp.vacation.repository.VacationRepository;

@Service
public class VacationService implements IVacationService {
	@Autowired
	private VacationRepository vacationRepository;

	/* 휴가 신청서 제출 */
	@Override
	@Transactional
	public int writeVacation(Vacation vacation) {
		int result = vacationRepository.insertVacation(vacation);
		for (int i = 0; i < vacation.getVacationDate().size(); i++) {
			result += vacationRepository.insertVacationDate(vacation.getVacationDate().get(i));
		}
		result += vacationRepository.updateDayoffremain(vacation.getEmpId(), vacation.getVacationCategoryId(),
				vacation.getCountDay());

		return result;
	}

	/* 휴가 list */
	@Override
	public int getVacationRow(String empId, String status, int type) {
		return vacationRepository.selectVacationCount(empId, status, type);
	}

	@Override
	public List<VacationList> getVacationList(Pager pager, String empId, String status, int type) {
		return vacationRepository.selectVacationList(pager, empId, status, type);
	}

	@Override
	public Employee getVacationDays(String empId) {
		return vacationRepository.selectVacationDays(empId);
	}

	/* 휴가 상세보기 */
	@Override
	public VacationDetail getVacationDetail(int vacationId) {
		return vacationRepository.selectVacationDetail(vacationId);
	}

	@Override
	public Vacation getApprovalEmp(String empId) {
		return vacationRepository.selectApprovalEmp(empId);
	}

	@Override
	public List<VacationDate> getVacationDate(int vacationId) {
		return vacationRepository.selectVacationDate(vacationId);
	}
	
	/* 연차정보 가져오기 */
	@Override
	public int getEmpDayOff(int vacationCategoryId, String empId) {
		int result = vacationRepository.selectEmpDayOff(vacationCategoryId, empId);
		return result;
	}
	
	/* 승인/반려 */
	@Transactional
	@Override
	public int processVacation(Vacation vacation) {
		int row = 0;
		if (vacation.getType().equals("y")) {
			for (VacationDate date : vacation.getVacationDate()) {
				row += vacationRepository.updateAttendance(date, vacation.getVacationName(),
						vacation.getEmpId(), vacation.getVacationCategoryId());
			}
		} else if (vacation.getType().equals("n")) {
			row += vacationRepository.updatedayoff(vacation);
		}
		// vacation 행 업데이트
		row += vacationRepository.updateVacation(vacation);

		return row;
	}
	@Override
	@Transactional
	public int deleteVacation(Vacation vacation) {
		int dayoffBack = vacationRepository.updatedayoff(vacation);
		if(dayoffBack == 1) {
			dayoffBack += vacationRepository.deleteVacation(vacation);
		}
		return dayoffBack;
	}

}
