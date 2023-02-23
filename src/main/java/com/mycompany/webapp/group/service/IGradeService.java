package com.mycompany.webapp.group.service;

import java.util.List;

import com.mycompany.webapp.group.model.Grade;

public interface IGradeService {
	public List<Grade> getGradeList();

	public int getDayOffByGradeId(int gradeId);
}
