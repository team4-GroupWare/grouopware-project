package com.mycompany.webapp.group.service;

import java.util.List;

import com.mycompany.webapp.group.model.Grade;

public interface IGradeService {
	/**
	 * 직급 목록
	 * @author : LEEJIHO
	 * @return : 모든 직급 목록
	 */
	public List<Grade> getGradeList();

	/**
	 * 
	 * @author : LEEYEONHEE
	 * @param gradeId
	 * @return : 직급별 잔여 연차
	 */
	public int getDayOffByGradeId(int gradeId);
}
