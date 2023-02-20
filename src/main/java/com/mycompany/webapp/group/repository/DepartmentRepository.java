package com.mycompany.webapp.group.repository;

import java.util.List;

import com.mycompany.webapp.group.model.Department;

public interface DepartmentRepository {
	public List<Department> selectDeptAll();
}
