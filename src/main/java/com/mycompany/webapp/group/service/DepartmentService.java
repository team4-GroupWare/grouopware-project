package com.mycompany.webapp.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.repository.DepartmentRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class DepartmentService implements IDepartmentService {
	@Autowired
	private DepartmentRepository departmentRepository;

	/**
	 * 
	 */
	@Override
	public List<Department> getDeptList() {
		log.info("실행");
		List<Department> departments = departmentRepository.selectDeptAll();
		return departments;
	}
}
