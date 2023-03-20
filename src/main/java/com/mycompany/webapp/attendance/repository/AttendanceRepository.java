package com.mycompany.webapp.attendance.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.model.AttendanceMonthStatus;

public interface AttendanceRepository {
	
	/*스케쥴러 테스트*/
	public List<String> selectTotalEmpId();
	
	/*스케쥴러 테스트*/
	public void insertThisWeek(@Param("clock_in")String clock_in,@Param("clock_out")String clock_out,@Param("empId")String empId, @Param("date")String date);
	
	/*사원의 오늘날짜 출근기록 조회*/
	public Attendance selectAttendance(@Param("attDate")String attDate, @Param("empId")String empId);
	
	/*사원의 이번달 출근 상태 달력 조회*/
	public List<String> selectAttStatusCal(@Param("empId")String empId, @Param("startDay")String startDay, @Param("endDay")String endDay);

	/*출근버튼 클릭*/
	public int insertAttendance(@Param("empId")String empId, @Param("status")String status);
	
	/* 출근 눌렀을 때 -> 반차일 경우*/
	public int updateAttClockIn(int attendanceId);
	
	/*퇴근 눌렀을 때*/
	public int updateAttClockOut(int attendanceId);
	
	/*결근자 조회 */
	public List<String> selectEmpAbsent(String today);
	
	/*결근자 결근으로 넣기*/
	public int insertEmpAbsent(@Param("empAbsent")String empAbsent, @Param("today")String today);
	
	/*퇴근 미처리  조회*/
	public List<Integer> selectNotOutEmp(String today);
	
	/*퇴근 미처리자 퇴근미처리로 수정 */
	public void updateEmpOut(int empNotOut);
	
	/*나의 근무 현황*/
	public List<Attendance> selectTotalAtt(String empId);
	
	/*주 근무 현황*/
	public String selectStatus(@Param("i")String i, @Param("empId")String empId);
	
	/*주 근무현황 */
	public int selectLateTime(@Param("today")String today, @Param("empId")String empId);
	
	/*월 근무 통계*/
	public AttendanceMonthStatus selectMonthCount(@Param("empId")String empId,@Param("month")String month);
	
}
