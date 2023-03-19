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
	
	/*휴가 신청서 제출*/
	int writeVacation(Vacation vacation);
	
	/*나의 휴가 list*/
	
	//휴가 목록 수
	int getVacationRow(String empId, String status, int type);
	//휴가 리스트
	List<VacationList> getVacationList(Pager pager, String empId, String status, int type);
	//휴가 사원의 정보
	Employee getVacationDays(String empId);
	
	/*나의 휴가 detail*/
	
	//휴가 상세보기
	VacationDetail getVacationDetail(int vacationId);
	//휴가 결재자
	Vacation getApprovalEmp(String empId);
	//휴가 일수 
	List<VacationDate> getVacationDate(int vacationId);
	
	//연차 정보 가져오기
	int getEmpDayOff(int vacationCategoryId, String empId);
	
	//승인/반려
	int processVacation(Vacation vacation);
	
	//휴가 삭제
	int deleteVacation(Vacation vacation);


}
