package com.mycompany.webapp.group.repository;

import java.util.List;

import com.mycompany.webapp.group.model.Team;

public interface TeamRepository {
	/**
	 * 부서별 팀 목록
	 * @author : LEEJIHO
	 * @param deptId
	 * @return
	 */
	public List<Team> selectTeamByDept(int deptId);
	
	/**
	 * 전체 팀 목록
	 * @author : LEEJIHO
	 * @return
	 */
	public List<Team> selectTeam();
} 
