package com.baseball.service.predict;

import java.util.List;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Predict;

public interface GamePredictDao {
	
	public void addUserPred(Predict pred);
	
	public void deleteUserPred(String userId, String date);
	
	public void updatePredSuccess(Game game);
	
	public List<Predict> getUserPred(String userId, String date);
	
	public double getPredAllocation(Game game);
	
	public void updateUserAfterGamePredPoint(Game game);

}
