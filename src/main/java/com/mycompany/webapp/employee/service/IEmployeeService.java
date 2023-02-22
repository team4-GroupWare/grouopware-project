package com.mycompany.webapp.employee.service;

import java.util.List;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.EmployeeService.LoginResult;

public interface IEmployeeService {
	public LoginResult login(Employee employee);
	public List<Employee> getEmpList(Pager pager);
	public int getTotalRows();
	public Employee getEmp(String empId);
	
	/**
	 * 
	 * @author : LEEJIHO
	 * @param employee
	 * @return 검색 조건에 부합한 사원 행 수 
	 */
	public int getSearchEmpRows(Employee employee);
}
