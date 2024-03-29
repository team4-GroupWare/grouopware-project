package com.mycompany.webapp.employee.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.component.MultipartFileResolver;
import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.model.EmployeePassword;
import com.mycompany.webapp.employee.repository.EmployeeRepository;
import com.mycompany.webapp.exception.AlreadyExistingIdException;

@Service
public class EmployeeService implements IEmployeeService {
	/**
	 * 
	 * @author : LEEYESEUNG
	 * @return enum : 성공, 아이디가 틀림, 비밀번호 틀림, 초기비밀번호임
	 */
	public enum LoginResult {
		SUCCESS, WRONG_ID, WRONG_PASSWORD, INITIAL_PASSWORD
	}
	
	@Autowired
	private MultipartFileResolver multipartFileResolver;
	@Autowired
	private EmployeeRepository employeeRepository;

	/**
	 * @author : LEEYESEUNG
	 * @param : employee : 로그인한 정보를 담은 객체
	 * @return LoginResult : 로그인한 결과가 무엇인지 Enum 타입으로 리턴
	 */
	@Override
	public LoginResult login(Employee employee) {
		//비밀번호 복호화
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		Employee dbEmployee = getEmployee(employee.getEmpId());
		if(dbEmployee == null) {
			return LoginResult.WRONG_ID;
		} else if(!(employee.getPassword().equals(dbEmployee.getPassword()))) {
			boolean checkPass = pe.matches(employee.getPassword(), dbEmployee.getPassword());
			if(checkPass == false) {
				return LoginResult.WRONG_PASSWORD;
			}
		} 
		
		employee.setName(dbEmployee.getName());
		employee.setTeamId(dbEmployee.getTeamId());
		employee.setGradeId(dbEmployee.getGradeId());
		employee.setManagerId(dbEmployee.getManagerId());
		employee.setInitialPassword(dbEmployee.isInitialPassword());
		if(employee.isInitialPassword()) {
			return LoginResult.INITIAL_PASSWORD;
		}
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

	/**
	 * 전체 사원 목록 메소드
	 * @author : LEEJIHO
	 * @param pager : Pager 객체
	 * @return List<Employee>
	 */
	@Override
	public List<Employee> getEmpList(Pager pager) {
		return employeeRepository.selectEmpList(pager);
	}

	/**
	 * 전체 사원 수
	 * @author : LEEJIHO
	 * @return 전체 사원수
	 */
	@Override
	public int getTotalRows() {
		return employeeRepository.selectEmpCount();
	}

	/**
	 * 사원 상세정보
	 * @author : LEEJIHO
	 * @return 사원
	 */
	@Override
	public Employee getEmp(String empId) {
		return employeeRepository.selectByEmpId(empId);
	}

	/**
	 * 검색한 사원 수
	 * @author : LEEJIHO
	 * @return 검색한 사원 수
	 */
	@Override
	public int getSearchEmpRows(Employee employee, int deptId) {
		return employeeRepository.selectSearchEmpCount(employee, deptId);
	}

	/**
	 * @author : LEEYESEUNG
	 * @param empId : 아이디 중복체크를 위한 작성된 empId
	 * @return boolean : 결과 반영
	 */
	@Override
	public boolean checkId(String empId) {
		boolean result = false;
		if(employeeRepository.selectEmpId(empId)==1) {
			result=true;
		}
		return result;
	}
	/**
	 * @author : LEEYESEUNG
	 * @param employee : 등록할 Employee 객체
	 * @return int : 반영된 행수
	 */
	public int register(Employee employee) throws Exception{
		int checkId = employeeRepository.selectEmpId(employee.getEmpId());
		//아이디가 이미 존재하면 예외를 발생시킴
		if(checkId==1) {
			throw new AlreadyExistingIdException("duplicate ID");
		}
		
		//패스워드 암호화
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		employee.setPassword(pe.encode(employee.getPassword()));
		return employeeRepository.insertEmployee(employee);
	}
	
	/**
	 * 검색한 사원 수
	 * @author : LEEJIHO
	 * @param pager : 페이징
	 * @return 검색한 사원 목록
	 */
	@Override
	public List<Employee> getSearchEmpList(Pager pager, Employee employee, int deptId) {
		return employeeRepository.selectSearchEmpList(pager, employee, deptId);
	}
	
	
	/**
	 * 팀별 사원 목록
	 * @author : LEEYEONHEE
	 * @param teamid : 팀아이디
	 * @return 팀별 사원 목록
	 */
	@Override
	public List<Employee> getEmpList(int teamid) {
		return employeeRepository.selectEmpListByTeamId(teamid);
	}

	/**
	 * @author : LEEYESEUNG
	 * @param employee : 업데이트할 Employee 객체
	 * @return int : 반영된 행수
	 */
	@Override
	public int updateEmployee(Employee employee) {
		//업데이트한 파일이 존재하면 파일을 VO에 다시 저장함
		if(employee.getAttachFiles() != null && employee.getAttachFiles().getSize() != 0) {
			try {
				employee = multipartFileResolver.getEmployeeFile(employee);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		return employeeRepository.updateEmployee(employee);
	}

	/**
	 * @author :LEEJIHO
	 * @param oldPwd : 작성했던 원래 비밀번호
	 * @param empId 
	 * @return int : 작성한 비밀번호가 db비밀번호와 일치하는지 결과
	 */
	@Override
	public int checkPassword(String oldPwd, String empId) {
		int row = 0;
		
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String dbPwd = employeeRepository.selectPasswordByEmpId(empId);
		
		boolean checkPass = pe.matches(oldPwd, dbPwd);
		if(checkPass == true) {
			row = 1;
		}
		return row;
	}

	/**
	 *  @author :LEEJIHO
	 *  @param newPwd : 새로 입력한 비밀번호
	 *  @param empId
	 *  @return int : 반영된 행수
	 */
	@Override
	public int updatePassword(String newPwd, String empId) {
		//패스워드 암호화
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String pwd = pe.encode(newPwd);
		
		int row = employeeRepository.updatePassword(pwd, empId);
		return row;
		
	}

	/**
	 * @author :LEEYESEUNG
	 * @param employeePassword : 현재 비밀번호, 원래 비밀번호, 사원 아이디 VO
	 * @return int : 업데이트 반영된 행수
	 */
	@Override
	public int grantInitialPassword(EmployeePassword employeePassword) {
		//패스워드 암호화
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String pwd = pe.encode(employeePassword.getNewPwd());
		
		int row = employeeRepository.updateInitPassword(pwd, employeePassword.getEmpId());
		return row;
	}

}
