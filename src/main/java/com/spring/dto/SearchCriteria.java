package com.spring.dto;

public class SearchCriteria extends PageCriteria{
	private String searchType;
	private String keyword;
	private String board_gubunCode;
	private Integer member_no;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getBoard_gubunCode() {
		return board_gubunCode;
	}
	public void setBoard_gubunCode(String board_gubunCode) {
		this.board_gubunCode = board_gubunCode;
	}
	public Integer getMember_no() {
		return member_no;
	}
	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}
	
}
