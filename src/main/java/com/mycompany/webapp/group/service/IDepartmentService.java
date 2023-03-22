package com.mycompany.webapp.group.service;

import java.util.List;

import com.mycompany.webapp.group.model.Department;

public interface IDepartmentService {
	/**
	 * 부서 목록
	 * @author : LEEJIHO
	 * @return : 모든 부서 목록
	 */
	public List<Department> getDeptList();
}
