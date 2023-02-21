package com.mycompany.webapp.attendance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.attendance.controller.AttendanceController;
import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.repository.AttendanceRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AttendanceService implements IAttendanceService {

	@Autowired
	AttendanceRepository attendanceRepository;
	
	@Override
	public Attendance getAttendance(String attDate,String empId) {
		log.info("실행");
		Attendance attendance = attendanceRepository.selectAttendance(attDate, empId);
		
		return attendance;
	}

	@Override
	public int insertAttendance(Attendance attendance) {
		log.info("실행");
		int result = attendanceRepository.insertAttendance(attendance);
		return result;
	}

	@Override
	public int updateLeave(String attDate, String empId) {
		log.info("실행");
		int result = attendanceRepository.updateLeave(attDate, empId);
		return 0;
	}

	

}
