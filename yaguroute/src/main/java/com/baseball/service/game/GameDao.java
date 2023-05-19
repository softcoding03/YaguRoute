package com.baseball.service.game;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Team;

@Mapper
public interface GameDao {
	
	public Team getTeamInfo(String teamCode);
	
	public Team getTeamInfoByTeamName(String teamName);

}
