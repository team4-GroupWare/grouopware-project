package com.mycompany.webapp.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.repository.AttendanceRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AttendanceService implements IAttendanceService {

	@Autowired
	AttendanceRepository attendanceRepository;

	@Override
	public Attendance getAttendance(String attDate, String empId) {
		log.info("실행");
		Attendance attendance = attendanceRepository.selectAttendance(attDate, empId);

		return attendance;
	}

	@Override
	public int insertAttendance(String empId, String status) {
		log.info("실행");
		int result = attendanceRepository.insertAttendance(empId,status);
		return result;
	}

	@Override
	public int updateLeave(String attDate, String empId) {
		log.info("실행");
		int result = attendanceRepository.updateLeave(attDate, empId);
		return 0;
	}

	@Override
	public void addEmpAtt(String today) {
		log.info("실행");
		// 1.오늘날짜에 행이 없는 경우
		
		// 1-1 전체 사원의 아이디 조회
		List<String> totalEmpId = attendanceRepository.selectTotalEmpId();
		log.info(totalEmpId);
		
		// 1-2 오늘날짜에 attendance 행의 아이디 조회
		List<String> todayEmpId = attendanceRepository.selectTodayEmpId(today);
		log.info(todayEmpId);
		
		// 1-3 오늘날짜에 없는 아이디 list
		for (String todayEmp : todayEmpId) {
			for (String totalEmp : totalEmpId) {
				if (totalEmp.equals(todayEmp)) {
					totalEmpId.remove(todayEmp);
					break;
				}
			}
		}
		log.info(totalEmpId);

		// 1-4 결근으로 insert
		for (String empAbsent : totalEmpId) {
			attendanceRepository.insertEmpAbsent(empAbsent, today);
		}

		// 2.오늘날짜에 출근은 있으나, 퇴근이 없는 경우
		List<String> outEmp = attendanceRepository.selectNotOutEmp(today);
		log.info(outEmp);
		String clock_out = today + " 18:00:00";
		
		// 2-1 오늘날짜에 attendance 행중에서 퇴근이 null이면 퇴근으로 update
		for (String empNotOut : outEmp) {
			attendanceRepository.updateEmpOut(empNotOut, clock_out, today);
		}

	}

	@Override
	public void ThisWeek(String date) {
		// 1-1 전체 사원의 아이디 조회
		List<String> totalEmpId = attendanceRepository.selectTotalEmpId();
		log.info(totalEmpId);
		String clock_in = date+" 09:00:00";
		String clock_out = date+" 18:00:00";
		for(String empId : totalEmpId ) {
			attendanceRepository.insertThisWeek(clock_in,clock_out,empId,date);
		}
	}

	@Override
	public List<Attendance> getTotalAtt(String empId) {
		List<Attendance> attendance = attendanceRepository.selectTotalAtt(empId);
		return attendance;
	}

	@Override
	public String getThisWeekStatus(String i, String empId) {
		String status = attendanceRepository.selectStatus(i,empId);
		return status;
	}

	@Override
	public int getattCountYear(int year, String empId) {
		return attendanceRepository.selectAttCountYear(year,empId);
	}

	@Override
	public int getlateCountYear(int year, String empId) {
		return attendanceRepository.selectLateCountYear(year,empId);
	}

	@Override
	public int getabsentCountYear(int year, String empId) {
		return attendanceRepository.selectAbsentCountYear(year,empId);
	}

	@Override
	public int getattCountMonth(int month, String empId) {
		return attendanceRepository.selectAttCountMonth(month,empId);
	}

	@Override
	public int getlateCountMonth(int month, String empId) {
		return attendanceRepository.selectLateCountMonth(month,empId);
	}

	@Override
	public int getabsentCountMonth(int month, String empId) {
		return attendanceRepository.selectAbsentCountMonth(month,empId);
	}

}
