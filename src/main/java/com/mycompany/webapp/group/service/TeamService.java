package com.mycompany.webapp.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.repository.TeamRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class TeamService implements ITeamService {
	@Autowired
	private TeamRepository teamRepository;
	
	/**
	 * 팀 목록 조회
	 * 
	 * @author : LEEJIHO
	 * @param deptId : 부서 아이디
	 * @return 부서 별 팀 목록
	 */
	@Override
	public List<Team> getTeamListById(int deptId) {
		log.info("실행");
		List<Team> teams = teamRepository.selectTeamByDept(deptId);
		return teams;
	}


	@Override
	public List<Team> getTeamList() {
		log.info("실행");
		List<Team> teams = teamRepository.selectTeam();
		return teams;
	}
}
