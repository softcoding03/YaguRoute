package com.baseball.service.predict.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Predict;
import com.baseball.service.game.GameDao;
import com.baseball.service.predict.GamePredictDao;
import com.baseball.service.predict.GamePredictService;

@Service
public class GamePredictServiceImpl implements GamePredictService {

	public GamePredictServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	@Qualifier("gamePredictDao")
	private GamePredictDao gamePredictDao;
	
	@Autowired
	@Qualifier("gameDao")
	private GameDao gameDao;
	
	//원하는 날짜의 유저의 예측정보를 조회
	public List<Predict> getUserPred(String userId, String date){
		return gamePredictDao.getUserPred(userId, date);
	}
	//사용자의 예측정보 확인
	public void addUserPred(Predict pred) {
		gamePredictDao.addUserPred(pred);
	}
	//사용자가 예측정보 취소를 눌렀을 시 삭제
	public void deleteUserPred(String userId, String date) {
		gamePredictDao.deleteUserPred(userId, date);
	}
	
	public void updatePredAfterGame() {
		LocalDate now = LocalDate.now();
		LocalDate tommorw = now.plusDays(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String strNow = tommorw.format(formatter);
		System.out.println(strNow);
		List<Game> gameList = gameDao.getGameListByDate(strNow);
		
		for(Game game : gameList) {
			System.out.println(game);
			gamePredictDao.updatePredSuccess(game);
			game.setWinningTeamAllocation(getPredAllocation(game));
			gameDao.updateGamePredAllocation(game);
			gamePredictDao.updateUserAfterGamePredPoint(game);
		}
		
	}
	
	public double getPredAllocation(Game game) {
		
		return gamePredictDao.getPredAllocation(game);
	}

}
