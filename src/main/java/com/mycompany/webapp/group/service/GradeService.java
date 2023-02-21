package com.mycompany.webapp.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.group.model.Grade;
import com.mycompany.webapp.group.repository.GradeRepository;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class GradeService implements IGradeService {
	
	@Autowired
	GradeRepository gradeRepository;

	/**
	 * @return : 모든 직급 list
	 */
	@Override
	public List<Grade> getGradeList() {
		log.info("실행");
		List<Grade> grades = gradeRepository.selectGrade();
		return grades;
	}

}
