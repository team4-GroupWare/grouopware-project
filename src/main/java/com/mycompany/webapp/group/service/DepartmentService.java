package com.mycompany.webapp.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.repository.DepartmentRepository;

@Service
public class DepartmentService implements IDepartmentService {
	@Autowired
	private DepartmentRepository departmentRepository;

	//부서 목록
	@Override
	public List<Department> getDeptList() {
		List<Department> departments = departmentRepository.selectDeptList();
		return departments;
	}
}
