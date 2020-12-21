package com.spring.dto;

import java.util.Date;

public class MemberDTO {
	private Integer member_no;
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_gander;
	private String member_birth_year;
	private String member_birth_month;
	private String member_birth_date;
	private String member_postCode;
	private String member_roadAddress;
	private String member_detailAddress;
	private String member_phone;
	private String member_email;
	private Date member_regdate;
	private String member_code;
	private String member_startdate;
	private String member_enddate;
	private String addMonth;
	private String addStartDate;
	private String addEndDate;
	
	public MemberDTO() {}

	public MemberDTO(Integer member_no, String member_id, String member_password, String member_name,
			String member_gander, String member_birth_year, String member_birth_month, String member_birth_date,
			String member_postCode, String member_roadAddress, String member_detailAddress, String member_phone,
			String member_email, Date member_regdate, String member_code, String member_startdate,
			String member_enddate, String addMonth, String addStartDate, String addEndDate) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_gander = member_gander;
		this.member_birth_year = member_birth_year;
		this.member_birth_month = member_birth_month;
		this.member_birth_date = member_birth_date;
		this.member_postCode = member_postCode;
		this.member_roadAddress = member_roadAddress;
		this.member_detailAddress = member_detailAddress;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_regdate = member_regdate;
		this.member_code = member_code;
		this.member_startdate = member_startdate;
		this.member_enddate = member_enddate;
		this.addMonth = addMonth;
		this.addStartDate = addStartDate;
		this.addEndDate = addEndDate;
	}

	public Integer getMember_no() {
		return member_no;
	}

	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_gander() {
		return member_gander;
	}

	public void setMember_gander(String member_gander) {
		this.member_gander = member_gander;
	}

	public String getMember_birth_year() {
		return member_birth_year;
	}

	public void setMember_birth_year(String member_birth_year) {
		this.member_birth_year = member_birth_year;
	}

	public String getMember_birth_month() {
		return member_birth_month;
	}

	public void setMember_birth_month(String member_birth_month) {
		this.member_birth_month = member_birth_month;
	}

	public String getMember_birth_date() {
		return member_birth_date;
	}

	public void setMember_birth_date(String member_birth_date) {
		this.member_birth_date = member_birth_date;
	}

	public String getMember_postCode() {
		return member_postCode;
	}

	public void setMember_postCode(String member_postCode) {
		this.member_postCode = member_postCode;
	}

	public String getMember_roadAddress() {
		return member_roadAddress;
	}

	public void setMember_roadAddress(String member_roadAddress) {
		this.member_roadAddress = member_roadAddress;
	}

	public String getMember_detailAddress() {
		return member_detailAddress;
	}

	public void setMember_detailAddress(String member_detailAddress) {
		this.member_detailAddress = member_detailAddress;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public Date getMember_regdate() {
		return member_regdate;
	}

	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	public String getMember_code() {
		return member_code;
	}

	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}

	public String getMember_startdate() {
		return member_startdate;
	}

	public void setMember_startdate(String member_startdate) {
		this.member_startdate = member_startdate;
	}

	public String getMember_enddate() {
		return member_enddate;
	}

	public void setMember_enddate(String member_enddate) {
		this.member_enddate = member_enddate;
	}

	public String getAddMonth() {
		return addMonth;
	}

	public void setAddMonth(String addMonth) {
		this.addMonth = addMonth;
	}

	public String getAddStartDate() {
		return addStartDate;
	}

	public void setAddStartDate(String addStartDate) {
		this.addStartDate = addStartDate;
	}

	public String getAddEndDate() {
		return addEndDate;
	}

	public void setAddEndDate(String addEndDate) {
		this.addEndDate = addEndDate;
	}
	
}
