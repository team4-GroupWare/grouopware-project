package com.mycompany.webapp.employee.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.email.MultipartFileResolver;
import com.mycompany.webapp.employee.AlreadyExistingIdException;
import com.mycompany.webapp.employee.NotExistingManagerException;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.repository.EmployeeRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
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
		log.info("실행");
		//비밀번호 복호화
		//PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		Employee dbEmployee = getEmployee(employee.getEmpId());
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
	public int getSearchEmpRows(Employee employee) {
		return employeeRepository.selectSearchEmpCount(employee);
	}

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
	 */
	public int register(Employee employee) throws Exception{
		log.info("실행");
		int checkId = employeeRepository.selectEmpId(employee.getEmpId());
		//아이디가 이미 존재하면 예외를 발생시킴
		if(checkId==1) {
			throw new AlreadyExistingIdException("duplicate ID");
		}
		
		//없는 매니저 아이디를 입력하면 예외를 발생시킴
		if(!employee.getManagerId().isEmpty()) {
			int checkManager = employeeRepository.selectEmpId(employee.getManagerId());
			if(checkManager==0) {
				throw new NotExistingManagerException("No exist manager");
			}
		}
		
		return employeeRepository.insertEmployee(employee);
	}
	
	/**
	 * 전체 사원 목록 메소드(페이징 x)
	 * @author : LEEYEONHEE	
	 * @return List<Employee>
	 */
	@Override
	public List<Employee> getEmpList() {
		return null;
	}

	/**
	 * 검색한 사원 수
	 * @author : LEEJIHO
	 * @param pager : 페이징
	 * @return 검색한 사원 목록
	 */
	@Override
	public List<Employee> getSearchEmpList(Pager pager, Employee employee) {
		return employeeRepository.selectSearchEmpList(pager, employee);
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
	 */
	@Override
	public int updateEmployee(Employee employee) {
		log.info("실행");
		//업데이트한 파일이 존재하면 파일을 VO에 다시 저장함
		if(employee.getAttachFiles() != null) {
			try {
				employee = multipartFileResolver.getEmployeeFile(employee);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return employeeRepository.updateEmployee(employee);
	}

	
}
