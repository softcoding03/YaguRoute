package com.baseball.service.predict;

import java.util.List;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Predict;

public interface GamePredictService {
	
	public List<Predict> getUserPred(String userId, String date);
	
	public void addUserPred(Predict pred);
	
	public void deleteUserPred(String userId, String date);
	
	public void updatePredAfterGame();
	
	public double getPredAllocation(Game game);

}
