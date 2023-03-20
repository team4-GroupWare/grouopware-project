package com.mycompany.webapp.vacation.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.vacation.model.Vacation;
import com.mycompany.webapp.vacation.model.VacationDate;
import com.mycompany.webapp.vacation.model.VacationDetail;
import com.mycompany.webapp.vacation.model.VacationList;

@Repository
public interface VacationRepository {
	
	//휴가 작성하기
	public int insertVacation(Vacation vacation);
	public int insertVacationDate(VacationDate vacationDate);

	//휴가 리스트 조회하기
	public int selectVacationCount(@Param("empId") String empId, @Param("status") String status,  @Param("type") int type );
	public List<VacationList> selectVacationList(@Param("pager") Pager pager, @Param("empId") String empId, @Param("status") String status,@Param("type") int type);
	public Employee selectVacationDays(@Param("empId")String empId);
	
	//휴가 상세 문서
	public VacationDetail selectVacationDetail(int vacationId);
	public List<VacationDate> selectVacationDate(int vacationId);
	
	//휴가 결제자 정보 조회
	public Vacation selectApprovalEmp(String empId);
	
	//신청자 연차 정보
	public int selectEmpDayOff(@Param("vacationCategoryId")int vacationCategoryId, @Param("empId")String empId);
	public void updateDayoffremain(@Param("empId")String empId, @Param("vacationCategoryId")int vacationCategoryId, @Param("countDay")double countDay);
	
	//출근 상태 업데이트
	public int updateAttendance(@Param("date")VacationDate date, @Param("vacationName")String vacationName, @Param("empId")String empId,@Param("vacationCategoryId")int vacationCategoryId);
	
	//휴가 신청서 업데이트
	public int updateVacation(Vacation vacation);
	
	//반려시 연차 다시 돌려주기
	public int updatedayoff(Vacation vacation);
	
	//휴가 삭제
	public int deleteVacation(Vacation vacation);
	

}
