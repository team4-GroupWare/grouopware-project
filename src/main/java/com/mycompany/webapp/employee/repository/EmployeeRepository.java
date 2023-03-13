package com.mycompany.webapp.employee.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.model.EmployeePassword;

@Repository
public interface EmployeeRepository {

	public Employee selectByEmpId(String empId);
	
	/**
	 * 전체 사원 목록
	 * @author : LEEJIHO
	 * @param pager
	 * @return
	 */
	public List<Employee> selectEmpList(Pager pager);
	
	/**
	 * 검색한 사원 목록
	 * @author : LEEJIHO
	 * @param pager
	 * @param employee
	 * @param deptId
	 * @return
	 */
	public List<Employee> selectSearchEmpList(@Param("pager") Pager pager, @Param("employee") Employee employee, @Param("deptId") int deptId);
	
	/**
	 * 전체 사원 수
	 * @author : LEEJIHO
	 * @return
	 */
	public int selectEmpCount();
	
	/**
	 * 검색한 사원 수
	 * @author : LEEJIHO
	 * @param employee
	 * @param deptId
	 * @return
	 */
	public int selectSearchEmpCount(@Param("employee") Employee employee, @Param("deptId") int deptId);
	public int selectEmpId(String empId);
	public int insertEmployee(Employee employee);
	public int selectManagerNo(int empNo);
	
	/**
	 * 팀별 사원 목록
	 * @author : LEEJIHO
	 * @param teamid
	 * @return
	 */
	public List<Employee> selectEmpListByTeamId(int teamid);
	
	/**
	 * @author LEEYESEUNG
	 * @param phone
	 * @return
	 */
	public int updateEmployee(Employee employee);
	/**
	 * 
	 * @param oldPwd
	 * @return
	 */
	public int selectEmpPasswordCount(@Param("oldPwd")String oldPwd, @Param("empId")String empId);
	/**
	 * 
	 * @param newPwd
	 * @return
	 */
	public int updatePassword(@Param("newPwd")String newPwd, @Param("empId")String empId);
	/**
	 * 
	 * @param employeePassword
	 * @return
	 */
	public int updateInitPassword(@Param("newPwd")String newPwd, @Param("empId")String empId);
}
