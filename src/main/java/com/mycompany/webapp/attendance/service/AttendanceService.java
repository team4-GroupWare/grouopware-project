package com.mycompany.webapp.attendance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.repository.IAttendanceRepository;

@Service
public class AttendanceService implements IAttendanceService {

	@Autowired
	IAttendanceRepository attendanceRepository;
	
	@Override
	public Attendance getAttendance(String attDate,String empId) {
		Attendance attendance = attendanceRepository.selectAttendance(attDate, empId);
		return attendance;
	}

}
