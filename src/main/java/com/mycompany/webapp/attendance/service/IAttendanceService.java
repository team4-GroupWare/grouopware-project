package com.mycompany.webapp.attendance.service;

import java.util.List;

import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.model.AttendanceMonthStatus;

public interface IAttendanceService {
	
	/*사원의 오늘날짜 출근기록 조회*/
	Attendance getAttendance(String attDate, String empId);
	
	/*사원의 이번달 출근 상태 달력 조회*/
	List<String> getAttStatus(String empId, String startDay, String endDay);
	
	/*출근버튼 클릭*/
	int insertAttendance(String empId, String status);

	/*출근 눌렀을 때 -> 반차일 경우*/
	int attClockInUpdate(int attendanceId);
	
	/*퇴근 눌렀을 때*/
	int attClockOutUpdate(int attendanceId);
	
	/*퇴근 없는 사원들 처리*/
	void addEmpAtt(String today);

	/*주 근무 현황*/
	String getThisWeekStatus(String i,String empId);
	
	/*주 근무 현황*/
	int getlateTime(String today, String empId);
	
	/*월 근무 통계*/
	AttendanceMonthStatus getMonthCount(String empId,String month);
	
	/*나의 근무 현황*/
	List<Attendance> getTotalAtt(String empId);
	
	
	

	
	
	



}
