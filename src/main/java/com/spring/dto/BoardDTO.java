package com.spring.dto;

import java.util.Date;

public class BoardDTO {
	private Integer board_no;
	private Integer member_no;
	private String board_title;
	private String board_content;
	private String board_writer;
	private Date board_regdate;
	private int board_readcnt;
	private String board_gubunCode;
	
	public BoardDTO() {}

	public BoardDTO(Integer board_no, Integer member_no, String board_title, String board_content, String board_writer,
			Date board_regdate, int board_readcnt, String board_gubunCode) {
		super();
		this.board_no = board_no;
		this.member_no = member_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_writer = board_writer;
		this.board_regdate = board_regdate;
		this.board_readcnt = board_readcnt;
		this.board_gubunCode = board_gubunCode;
	}

	public Integer getBoard_no() {
		return board_no;
	}

	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}

	public Integer getMember_no() {
		return member_no;
	}

	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public Date getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}

	public int getBoard_readcnt() {
		return board_readcnt;
	}

	public void setBoard_readcnt(int board_readcnt) {
		this.board_readcnt = board_readcnt;
	}

	public String getBoard_gubunCode() {
		return board_gubunCode;
	}

	public void setBoard_gubunCode(String board_gubunCode) {
		this.board_gubunCode = board_gubunCode;
	}
	
	
}
