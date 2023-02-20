package com.mycompany.webapp.employee.service;

import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.EmployeeService.LoginResult;

public interface IEmployeeService {
	public LoginResult login(Employee employee);

}
