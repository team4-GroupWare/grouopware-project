package com.mycompany.webapp.group.repository;

import java.util.List;

import com.mycompany.webapp.group.model.Team;

public interface TeamRepository {
	public List<Team> selectTeamByDept(int deptId);
	public List<Team> selectTeam();
} 
