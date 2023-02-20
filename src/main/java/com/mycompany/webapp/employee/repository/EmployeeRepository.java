package com.mycompany.webapp.employee.repository;

import org.springframework.stereotype.Repository;

import com.mycompany.webapp.employee.model.Employee;

@Repository
public interface EmployeeRepository {
	Employee selectByEmpId(String empId);

}
