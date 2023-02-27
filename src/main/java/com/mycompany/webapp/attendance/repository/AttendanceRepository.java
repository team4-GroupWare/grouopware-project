package com.mycompany.webapp.attendance.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.attendance.model.Attendance;

public interface AttendanceRepository {

	public Attendance selectAttendance(@Param("attDate")String attDate, @Param("empId")String empId);

	public int insertAttendance(@Param("empId")String empId, @Param("status")String status);

	public int updateLeave(@Param("attDate")String attDate, @Param("empId")String empId);

	public List<String> selectTotalEmpId();

	public List<String> selectTodayEmpId(String today);

	public int insertEmpAbsent(@Param("empAbsent")String empAbsent, @Param("today")String today);

	public List<String> selectNotOutEmp(String today);

	public void updateEmpOut(@Param("empNotOut")String empNotOut, @Param("clock_out")String clock_out ,@Param("today")String today);

	public void insertThisWeek(@Param("clock_in")String clock_in,@Param("clock_out")String clock_out,@Param("empId")String empId, @Param("date")String date);

	public List<Attendance> selectTotalAtt(String empId);

	public String selectStatus(@Param("i")String i, @Param("empId")String empId);

	public int selectAttCountYear(@Param("year")int year, @Param("empId")String empId);

	public int selectLateCountYear(@Param("year")int year, @Param("empId")String empId);

	public int selectAbsentCountYear(@Param("year")int year, @Param("empId")String empId);

	public int selectAttCountMonth(@Param("month")int month, @Param("empId")String empId);

	public int selectLateCountMonth(@Param("month")int month, @Param("empId")String empId);

	public int selectAbsentCountMonth(@Param("month")int month, @Param("empId")String empId);

}
