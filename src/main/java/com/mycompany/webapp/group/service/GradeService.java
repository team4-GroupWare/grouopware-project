package com.mycompany.webapp.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.group.model.Grade;
import com.mycompany.webapp.group.repository.GradeRepository;

@Service
public class GradeService implements IGradeService {
	
	@Autowired
	GradeRepository gradeRepository;

	/**
	 * @return : 모든 직급 list
	 */
	@Override
	public List<Grade> getGradeList() {
		List<Grade> grades = gradeRepository.selectGrade();
		return grades;
	}

	@Override
	public int getDayOffByGradeId(int gradeId) {
		int dayOff = gradeRepository.selectDayOff(gradeId);
		return dayOff;
	}

}
