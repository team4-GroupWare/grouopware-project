package com.mycompany.webapp.attendance.service;

import com.mycompany.webapp.attendance.model.Attendance;

public interface IAttendanceService {

	Attendance getAttendance(String attDate, String empId);

	int insertAttendance(Attendance attendance);

	int updateLeave(String attDate, String empId);

	void addEmpAtt(String today);

	void ThisWeek(String date);



}
