package com.mycompany.webapp.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.repository.TeamRepository;

@Service
public class TeamService implements ITeamService {
	@Autowired
	private TeamRepository teamRepository;
	
	//부서 별 팀 목록
	@Override
	public List<Team> getTeamListById(int deptId) {
		List<Team> teams = teamRepository.selectTeamByDept(deptId);
		return teams;
	}

	//모든 팀 목록
	@Override
	public List<Team> getTeamList() {
		List<Team> teams = teamRepository.selectTeam();
		return teams;
	}
}
