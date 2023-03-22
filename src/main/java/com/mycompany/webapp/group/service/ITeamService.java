package com.mycompany.webapp.group.service;

import java.util.List;

import com.mycompany.webapp.group.model.Team;

public interface ITeamService {
	/**
	 * 부서 별 팀 목록
	 * @author : LEEJIHO
	 * @param deptId
	 * @return : 부서 별 팀 목록
	 */
	public List<Team> getTeamListById(int deptId);
	
	/**
	 * 모든 팀 목록
	 * @author : LEEJIHO
	 * @return : 모든 팀 목록
	 */
	public List<Team> getTeamList();
} 
