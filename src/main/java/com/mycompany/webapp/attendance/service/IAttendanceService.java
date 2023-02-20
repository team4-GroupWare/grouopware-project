package com.mycompany.webapp.attendance.service;

import com.mycompany.webapp.attendance.model.Attendance;

public interface IAttendanceService {

	Attendance getAttendance(String attDate, String empId);

}
