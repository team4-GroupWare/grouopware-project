package com.mycompany.webapp.employee.service;

import java.util.List;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.EmployeeService.LoginResult;

public interface IEmployeeService {
	public LoginResult login(Employee employee);
	/**
	 * 전체 사원 목록
	 * @author : LEEJIHO
	 * @param pager
	 * @return
	 */
	public List<Employee> getEmpList(Pager pager);
	public int getTotalRows();
	public Employee getEmp(String empId);
	/**
	 * 검색 조건에 부합한 사원 행 수 
	 * @author : LEEJIHO
	 * @param employee : 사원
	 * @param deptId : 부서 아이디
	 * @return
	 */
	public int getSearchEmpRows(Employee employee, int deptId);
	public boolean checkId(String empId);
	public int register(Employee employee) throws Exception;
	/**
	 * 검색 조건에 부합한 사원 목록
	 * @author : LEEJIHO
	 * @param pager : 페이징 처리를 위한 페이저
	 * @param employee : 사원
	 * @param deptId : 부서 아이디
	 * @return
	 */
	public List<Employee> getSearchEmpList(Pager pager, Employee employee, int deptId);
	public List<Employee> getEmpList(int teamid);
	/**
	 * @author : LEEYESEUNG
	 * @param phone
	 */
	public int updateEmployee(Employee employee);
}
