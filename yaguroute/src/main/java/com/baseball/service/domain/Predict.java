package com.baseball.service.domain;

import java.util.List;

public class Predict {
	//Field
	private int predNo;
	private String predGameCode;
	private String predUserId;
	private String predWinningTeamCode;
	private int predPoint;
	private int afterGamePredPoint;
	private String predSuccess;
	private List<Predict> addPred;
	
	
	public List<Predict> getAddPred() {
		return addPred;
	}
	public void setAddPred(List<Predict> addPred) {
		this.addPred = addPred;
	}
	public int getPredNo() {
		return predNo;
	}
	public void setPredNo(int predNo) {
		this.predNo = predNo;
	}
	
	public String getPredGameCode() {
		return predGameCode;
	}
	public void setPredGameCode(String predGameCode) {
		this.predGameCode = predGameCode;
	}
	public String getPredUserId() {
		return predUserId;
	}
	public void setPredUserId(String predUserId) {
		this.predUserId = predUserId;
	}
	public String getPredWinningTeamCode() {
		return predWinningTeamCode;
	}
	public void setPredWinningTeamCode(String predWinningTeamCode) {
		this.predWinningTeamCode = predWinningTeamCode;
	}
	public int getPredPoint() {
		return predPoint;
	}
	public void setPredPoint(int predPoint) {
		this.predPoint = predPoint;
	}
	public int getAfterGamePredPoint() {
		return afterGamePredPoint;
	}
	public void setAfterGamePredPoint(int afterGamePredPoint) {
		this.afterGamePredPoint = afterGamePredPoint;
	}
	public String getPredSuccess() {
		return predSuccess;
	}
	public void setPredSuccess(String predSuccess) {
		this.predSuccess = predSuccess;
	}
	@Override
	public String toString() {
		return "Predict [predNo=" + predNo + ", predGameCode=" + predGameCode + ", predUserId=" + predUserId
				+ ", predWinningTeamCode=" + predWinningTeamCode + ", predPoint=" + predPoint + ", afterGamePredPoint="
				+ afterGamePredPoint + ", predSuccess=" + predSuccess + "]";
	}
	
}
