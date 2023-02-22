package com.mycompany.webapp.employee.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.employee.model.Employee;

@Repository
public interface EmployeeRepository {
	public Employee selectByEmpId(String empId);
	public List<Employee> selectEmpList(Pager pager);
	public int selectEmpCount();
	public int selectSearchEmpCount(Employee employee);
	public int selectEmpId(String empId);
	public int insertEmployee(Employee employee);
	public int selectManagerNo(int empNo);
}
