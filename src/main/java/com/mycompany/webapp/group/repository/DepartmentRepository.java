package com.mycompany.webapp.group.repository;

import java.util.List;

import com.mycompany.webapp.group.model.Department;

public interface DepartmentRepository {
	/**
	 * 부서 목록
	 * @author : LEEJIHO
	 * @return
	 */
	public List<Department> selectDeptList();
}
