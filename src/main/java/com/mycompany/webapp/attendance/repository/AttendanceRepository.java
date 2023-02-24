package com.mycompany.webapp.attendance.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.attendance.model.Attendance;

public interface AttendanceRepository {

	public Attendance selectAttendance(@Param("attDate")String attDate, @Param("empId")String empId);

	public int insertAttendance(Attendance attendance);

	public int updateLeave(@Param("attDate")String attDate, @Param("empId")String empId);

	public List<String> selectTotalEmpId();

	public List<String> selectTodayEmpId(String today);

	public int insertEmpAbsent(@Param("empAbsent")String empAbsent, @Param("today")String today);

	public List<String> selectNotOutEmp(String today);

	public void updateEmpOut(@Param("empNotOut")String empNotOut, @Param("clock_out")String clock_out ,@Param("today")String today);

	public void insertThisWeek(@Param("clock_in")String clock_in,@Param("clock_out")String clock_out,@Param("empId")String empId, @Param("date")String date);

}
