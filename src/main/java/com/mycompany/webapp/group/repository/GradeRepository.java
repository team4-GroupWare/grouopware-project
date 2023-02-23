package com.mycompany.webapp.group.repository;

import java.util.List;

import com.mycompany.webapp.group.model.Grade;

public interface GradeRepository {
	/**
	 * @author LEEYESEUNG
	 * @return 전체 grade를 담은 list 
	 */
	public List<Grade> selectGrade();
	/**
	 * @author LEEYESUNG
	 * @return 직급별 연차 개수
	 */
	public int selectDayOff(int gradeId);

}
