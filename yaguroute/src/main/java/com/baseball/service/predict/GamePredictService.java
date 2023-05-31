package com.baseball.service.predict;

import java.util.List;
import java.util.Map;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Predict;

public interface GamePredictService {
	
	public Map<String, Object> getUserPred(String userId, String date) throws Exception;
	
	public void addUserPred(List<Predict> pred) throws Exception ;
	
	public void deleteUserPred(String userId, String date) throws Exception;
	
	public void updatePredAfterGame();
	
	public double getPredAllocation(Game game);

}