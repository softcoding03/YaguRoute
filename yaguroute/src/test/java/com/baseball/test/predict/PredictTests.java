package com.baseball.test.predict;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Predict;
import com.baseball.service.game.GameService;
import com.baseball.service.predict.GamePredictDao;
import com.baseball.service.predict.GamePredictService;
import com.baseball.service.user.UserDao;


@SpringBootTest
public class PredictTests {

	public PredictTests() {
	}
	
	@Autowired
	@Qualifier("gamePredictDao")
	private GamePredictDao gamePredictDao;
	
	@Autowired
	@Qualifier("gamePredictServiceImpl")
	private GamePredictService gamePredictService;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	//@Test
	public void addUserPredTest() throws Exception{
		Predict pred = new Predict();
		pred.setPredGame(gameService.getGameInfo("20230523HTHH02023"));
		pred.setPredUser(userDao.getUser("rockseong4"));
		pred.setPredWinningTeamCode("HH");
		pred.setPredPoint(300);
		pred.setAfterGamePredPoint(300);
		gamePredictDao.addUserPred(pred);
	}
	
	//@Test
	public void deleteUserPred() {
		gamePredictDao.deleteUserPred("rockseong3","2008-03-29");
	}
	
	//@Test
	public void updatePredSuccess() {
		Predict pred = new Predict();
		List<Game> tmpGame = gameService.getGameListByDate("2008-03-29");
		for(Game game : tmpGame) {
			pred.setPredGame(game);
			gamePredictDao.updatePredSuccess(game);
		}
	}
	
	//@Test
	public void getUserPred() {
		List<Predict> predList = gamePredictDao.getUserPred("rockseong3","2008-03-29");
		for(Predict tmp : predList) {
			System.out.println(tmp);
		}
	}
	
	//@Test
	public void updateUserAfterGamePredPoint() {
		gamePredictService.updatePredAfterGame();
	}
	
	//@Test
	public void deleteUserPredService() throws Exception{
		gamePredictService.deleteUserPred("rockseong4","2008-03-29");
	}

}
