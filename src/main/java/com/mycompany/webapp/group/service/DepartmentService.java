package com.mycompany.webapp.group.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.group.repository.DepartmentRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class DepartmentService implements IDepartmentService {
	@Autowired
	private DepartmentRepository departmentRepository;
}
