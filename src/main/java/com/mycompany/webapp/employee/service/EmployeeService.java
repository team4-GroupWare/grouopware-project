package com.mycompany.webapp.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.repository.EmployeeRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class EmployeeService implements IEmployeeService {
	
	public enum LoginResult {
		SUCCESS, WRONG_ID, WRONG_PASSWORD, INITIAL_PASSWORD
	}
	
	@Autowired
	private EmployeeRepository employeeRepository;

	/**
	 * @author : LEEYESEUNG
	 * @param : employee
	 * @return LoginResult
	 */
	@Override
	public LoginResult login(Employee employee) {
		log.info("실행");
		//비밀번호 복호화
		//PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		Employee dbEmployee = getEmployee(employee.getEmpId());
		System.out.println(dbEmployee);
		if(dbEmployee == null) {
			return LoginResult.WRONG_ID;
		} else if(!(employee.getPassword().equals(dbEmployee.getPassword()))) {
			//boolean checkPass = pe.matches(member.getMpassword(), dbMember.getMpassword());
			return LoginResult.WRONG_PASSWORD;
		} 
		
		if(employee.isInitialPassword()) {
			return LoginResult.INITIAL_PASSWORD;
		}
		employee.setName(dbEmployee.getName());
		employee.setTeamId(dbEmployee.getTeamId());
		employee.setGradeId(dbEmployee.getGradeId());
		employee.setManagerId(dbEmployee.getManagerId());
		return LoginResult.SUCCESS;
	}

	/**
	 * 
	 * @author : LEEYESEUNG
	 * @param empId
	 * @return Employee 객체
	 */
	private Employee getEmployee(String empId) {
		return employeeRepository.selectByEmpId(empId);
	}

	@Override
	public List<Employee> getEmpListByDeptId(int deptId) {
		return employeeRepository.selectEmpListByDeptId(deptId);
	}
	
}
