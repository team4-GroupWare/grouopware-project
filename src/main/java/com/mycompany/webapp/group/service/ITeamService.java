package com.mycompany.webapp.group.service;

import java.util.List;

import com.mycompany.webapp.group.model.Team;

public interface ITeamService {
	public List<Team> getTeamListById(int deptId);
	public List<Team> getTeamList();
} 
