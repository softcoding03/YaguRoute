package com.baseball.common.domain;

public class Search {
	 //field
	private String searchCondiotion;
	private String searchKeyword;
	private String standard;
	private String category;
	private String teamCondition;
	private int currentPage;
	private int pageSize;
	
	//constructor
	public Search() {
		// TODO Auto-generated constructor stub
	}
	
	//getter Method
	public String getSearchCondiotion() {
		return searchCondiotion;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public String getStandard() {
		return standard;
	}

	public String getCategory() {
		return category;
	}

	public String getTeamCondition() {
		return teamCondition;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	//setter Method
	public void setSearchCondiotion(String searchCondiotion) {
		this.searchCondiotion = searchCondiotion;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setTeamCondition(String teamCondition) {
		this.teamCondition = teamCondition;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
	

}
