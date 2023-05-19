package com.baseball.test.game;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Team;

@Mapper
public interface GameDaoTest {

	public Team getTeamInfoByTeamName(String teamName);

}
