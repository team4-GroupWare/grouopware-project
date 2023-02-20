package com.mycompany.webapp.attendance.repository;

import com.mycompany.webapp.attendance.model.Attendance;

public interface IAttendanceRepository {

	Attendance selectAttendance(String attDate, String empId);

}
