package com.spring.dto;

public class MemoDTO {
	private Integer member_no;
	private Integer memo_no;
	private String memo_startdate;
	private String memo_enddate;
	private String memo_content;
	private String now_date;
	private String memo_title;
	
	public MemoDTO() {}

	public Integer getMember_no() {
		return member_no;
	}

	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}

	public Integer getMemo_no() {
		return memo_no;
	}

	public void setMemo_no(Integer memo_no) {
		this.memo_no = memo_no;
	}

	public String getMemo_startdate() {
		return memo_startdate;
	}

	public void setMemo_startdate(String memo_startdate) {
		this.memo_startdate = memo_startdate;
	}

	public String getMemo_enddate() {
		return memo_enddate;
	}

	public void setMemo_enddate(String memo_enddate) {
		this.memo_enddate = memo_enddate;
	}

	public String getMemo_content() {
		return memo_content;
	}

	public void setMemo_content(String memo_content) {
		this.memo_content = memo_content;
	}

	public String getNow_date() {
		return now_date;
	}

	public void setNow_date(String now_date) {
		this.now_date = now_date;
	}

	public String getMemo_title() {
		return memo_title;
	}

	public void setMemo_title(String memo_title) {
		this.memo_title = memo_title;
	}
	
	
}
