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

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class VacationService implements IVacationService {
	@Autowired
	private VacationRepository vacationRepository;

	/* 휴가 신청서 제출 */
	@Override
	@Transactional
	public int writeVacation(Vacation vacation) {
		log.info("실행");
		int result = vacationRepository.insertVacation(vacation);
		log.info(result);
		for (int i = 0; i < vacation.getVacationDate().size(); i++) {
			vacationRepository.insertVacationDate(vacation.getVacationDate().get(i));
		}
		vacationRepository.updateDayoffremain(vacation.getEmpId(), vacation.getVacationCategoryId(),
				vacation.getCountDay());

		return 2;
	}

	/* 휴가 list */
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

	/* 휴가 상세보기 */
	@Override
	public VacationDetail getVacationDetail(int vacationId) {
		log.info("실행");
		return vacationRepository.selectVacationDetail(vacationId);
	}

	@Override
	public Vacation getApprovalEmp(String empId) {
		log.info("실행");
		return vacationRepository.selectApprovalEmp(empId);
	}

	@Override
	public List<VacationDate> getVacationDate(int vacationId) {
		log.info("실행");
		return vacationRepository.selectVacationDate(vacationId);
	}
	
	/* 연차정보 가져오기 */
	@Override
	public int getEmpDayOff(int vacationCategoryId, String empId) {
		log.info("실행");
		log.info(vacationCategoryId);
		log.info(empId);
		int result = vacationRepository.selectEmpDayOff(vacationCategoryId, empId);
		log.info(result);
		return result;
	}
	
	/* 승인/반려 */
	@Transactional
	@Override
	public int processVacation(Vacation vacation) {
		log.info("실행");
		if (vacation.getType().equals("y")) {
			for (VacationDate date : vacation.getVacationDate()) {
				log.info(date);
				int attUpdate = vacationRepository.updateAttendance(date, vacation.getVacationName(),
						vacation.getEmpId(), vacation.getVacationCategoryId());
			}
		} else if (vacation.getType().equals("n")) {
			log.info("실행");
			int dayoffBack = vacationRepository.updatedayoff(vacation);
		}
		log.info("실행");
		// vacation 행 업데이트
		int vacationUpdate = vacationRepository.updateVacation(vacation);

		return 3;
	}
	@Override
	@Transactional
	public int deleteVacation(Vacation vacation) {
		log.info("실행");
		int dayoffBack = vacationRepository.updatedayoff(vacation);
		int delete = vacationRepository.deleteVacation(vacation);
		return 2;
	}

}
