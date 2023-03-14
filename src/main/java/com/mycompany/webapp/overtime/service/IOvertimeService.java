package com.mycompany.webapp.overtime.service;

import java.util.List;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.overtime.model.Overtime;

public interface IOvertimeService {

	int writeOvertime(Overtime overtime);

	int getOvertimeRow(String empId, String status, int type);

	List<Overtime> getOvertimeList(Pager pager, String empId, String status, int type);

	Overtime getOvertimeDetail(int overtimeId);

	int getweekOverTime(String sunday, String empId);

	int overTimeProcess(String type, int overtimeId, String workDate, String empId, String workDateClock);

	

}
