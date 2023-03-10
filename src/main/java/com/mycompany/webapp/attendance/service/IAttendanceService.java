package com.mycompany.webapp.attendance.service;

import java.util.List;

import com.mycompany.webapp.attendance.model.Attendance;
import com.mycompany.webapp.attendance.model.AttendanceMonthStatus;

public interface IAttendanceService {

	Attendance getAttendance(String attDate, String empId);

	int insertAttendance(String empId, String status);

	int updateLeave(String attDate, String empId);

	void addEmpAtt(String today);

	void ThisWeek(String date);

	List<Attendance> getTotalAtt(String empId);

	String getThisWeekStatus(String i,String empId);

	int getattCountYear(int year, String empId);

	int getlateCountYear(int year, String empId);

	int getabsentCountYear(int year, String empId);

	int getattCountMonth(int month, String empId);

	int getlateCountMonth(int month, String empId);

	int getabsentCountMonth(int month, String empId);

	int updateHalfAtt(String today, String empId);

	AttendanceMonthStatus getMonthCount(String empId,String month);

	int getlateTime(String today, String empId);

	List<String> getAttStatus(String empId, String startDay, String endDay);



}
