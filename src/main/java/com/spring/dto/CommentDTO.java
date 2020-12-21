package com.spring.dto;

import java.util.Date;

public class CommentDTO {
	private Integer comment_no;
	private String comment_content;
	private String comment_writer;
	private Integer board_no;
	private Integer member_no;
	private Date comment_regdate;
	private Date comment_updateDate;
	
	 public CommentDTO() {}

	public CommentDTO(Integer comment_no, String comment_content, String comment_writer, Integer board_no,
			Integer member_no, Date comment_regdate, Date comment_updateDate) {
		super();
		this.comment_no = comment_no;
		this.comment_content = comment_content;
		this.comment_writer = comment_writer;
		this.board_no = board_no;
		this.member_no = member_no;
		this.comment_regdate = comment_regdate;
		this.comment_updateDate = comment_updateDate;
	}

	public Integer getComment_no() {
		return comment_no;
	}

	public void setComment_no(Integer comment_no) {
		this.comment_no = comment_no;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_writer() {
		return comment_writer;
	}

	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
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

	public Date getComment_regdate() {
		return comment_regdate;
	}

	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}

	public Date getComment_updateDate() {
		return comment_updateDate;
	}

	public void setComment_updateDate(Date comment_updateDate) {
		this.comment_updateDate = comment_updateDate;
	}
	 
	 
		
}
