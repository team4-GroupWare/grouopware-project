package com.mycompany.webapp.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.model.AttendanceMonthStatus;
import com.mycompany.webapp.attendance.repository.AttendanceRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AttendanceService implements IAttendanceService {
	@Autowired
	AttendanceRepository attendanceRepository;
	
	/*	스케쥴러 테스트 */
	@Override
	public void ThisWeek(String date) {
		log.info("실행");
		// 1-1 전체 사원의 아이디 조회
		List<String> totalEmpId = attendanceRepository.selectTotalEmpId();
		log.info(totalEmpId);
		String clock_in = date+" 08:43:00";
		String clock_out = date+" 18:47:00";
		for(String empId : totalEmpId ) {
			attendanceRepository.insertThisWeek(clock_in,clock_out,empId,date);
		}
	}
	
	/*사원의 오늘날짜 출근기록 조회*/
	@Override
	public Attendance getAttendance(String attDate, String empId) {
		log.info("실행");
		Attendance attendance = attendanceRepository.selectAttendance(attDate, empId);

		return attendance;
	}
	
	/*사원의 이번달 출근 상태 달력 조회*/
	@Override
	public List<String> getAttStatus(String empId, String startDay, String endDay) {
		return attendanceRepository.selectAttStatusCal(empId,startDay,endDay);
	}
	
	/*출근버튼 클릭*/
	@Override
	public int insertAttendance(String empId, String status) {
		log.info("실행");
		int result = attendanceRepository.insertAttendance(empId,status);
		return result;
	}
	
	/*출근 눌렀을 때 -> 반차일 경우*/
	@Override
	public int attClockInUpdate(int attendanceId) {
		return attendanceRepository.updateAttClockIn(attendanceId);
	}
	
	/*퇴근 눌렀을 때*/
	@Override
	public int attClockOutUpdate(int attendanceId) {
		return attendanceRepository.updateAttClockOut(attendanceId);
	}
	
	/*퇴근 없는 사원들 처리*/
	@Transactional
	@Override
	public void addEmpAtt(String today) {
		//결근
		List<String> empAbsent = attendanceRepository.selectEmpAbsent(today);
		log.info(empAbsent);
		for (String absentEmp : empAbsent) {
			attendanceRepository.insertEmpAbsent(absentEmp, today);
		}
		//퇴근미처리
		List<Integer> outEmp = attendanceRepository.selectNotOutEmp(today);
		log.info(outEmp);
		for (int empNotOut : outEmp) {
			attendanceRepository.updateEmpOut(empNotOut);
		}
	}
	
	/*주 근무 현황*/
	@Override
	public String getThisWeekStatus(String i, String empId) {
		String status = attendanceRepository.selectStatus(i,empId);
		return status;
	}
	/*주 근무 현황*/
	@Override
	public int getlateTime(String today, String empId) {
		return attendanceRepository.selectLateTime(today,empId);
	}
	
	/*월 근무 통계*/
	@Override
	public AttendanceMonthStatus getMonthCount(String empId,String month) {
		return attendanceRepository.selectMonthCount(empId,month);
	}
	
	/*나의 근무 현황*/
	public List<Attendance> getTotalAtt(String empId) {
		List<Attendance> attendance = attendanceRepository.selectTotalAtt(empId);
		return attendance;
	}
}
