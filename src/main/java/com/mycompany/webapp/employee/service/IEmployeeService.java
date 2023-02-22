package com.mycompany.webapp.employee.service;

import java.util.List;

import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.EmployeeService.LoginResult;

public interface IEmployeeService {
	public LoginResult login(Employee employee);
	public List<Employee> getEmpList();
	public boolean checkId(String empId);
	public int register(Employee employee) throws Exception;
}
