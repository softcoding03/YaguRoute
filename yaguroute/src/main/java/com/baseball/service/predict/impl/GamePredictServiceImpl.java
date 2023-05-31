package com.baseball.service.predict.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Predict;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameDao;
import com.baseball.service.predict.GamePredictDao;
import com.baseball.service.predict.GamePredictService;
import com.baseball.service.user.UserDao;

@Service
public class GamePredictServiceImpl implements GamePredictService {

	public GamePredictServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Autowired
	@Qualifier("gamePredictDao")
	private GamePredictDao gamePredictDao;
	
	@Autowired
	@Qualifier("gameDao")
	private GameDao gameDao;
	
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	//원하는 날짜의 유저의 예측정보를 조회
	public Map<String, Object> getUserPred(String userId, String date) throws Exception{
		List<Predict> paramPred = gamePredictDao.getUserPred(userId, date);
		List<Game> paramGame = gameDao.getGameListByDate(date);
		Map<String, Object> map = new HashMap<>();
		map.put("gameList", paramGame);
		map.put("predList", paramPred);
		
		return map;
	}
	
	//사용자의 예측정보 추가
	public void addUserPred(List<Predict> pred) throws Exception {
		User user = userDao.getUser(pred.get(0).getPredUserId());
		int totalUserPredPoint = 0;
		for(Predict predTmp : pred) {
			totalUserPredPoint += predTmp.getPredPoint();
			gamePredictDao.addUserPred(predTmp);
		}
		//예측할때 사용한 포인트(상품 구매할때 사용한포인트)
		user.setUserPoint(user.getUserPoint()-totalUserPredPoint);
		userDao.updatePoint(user);
	}
	
	//사용자가 예측정보 취소를 눌렀을 시 삭제
	public void deleteUserPred(String userId, String date) throws Exception{
		List<Predict> predict = gamePredictDao.getUserPred(userId, date);
		int totalUserPredPoint = 0;
		for(Predict predTmp : predict) {
			totalUserPredPoint += predTmp.getPredPoint();
		}
		User user = userDao.getUser(userId);
		user.setUserPoint(user.getUserPoint()+totalUserPredPoint);
		userDao.updatePoint(user);
		gamePredictDao.deleteUserPred(userId, date);
	}
	
	public void updatePredAfterGame() {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String strNow = now.format(formatter);
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
