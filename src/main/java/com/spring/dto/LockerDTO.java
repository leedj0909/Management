package com.spring.dto;

public class LockerDTO {
	private Integer locker_no;
	private String locker_use;
	private Integer member_no;
	private String locker_id;
	private String locker_startdate;
	private String locker_enddate;
	private String locker_name;
	private String locker_phone;
	private String locker_email;
	
	public LockerDTO() {}

	public LockerDTO(Integer locker_no, String locker_use, Integer member_no, String locker_id, String locker_startdate,
			String locker_enddate, String locker_name, String locker_phone, String locker_email) {
		super();
		this.locker_no = locker_no;
		this.locker_use = locker_use;
		this.member_no = member_no;
		this.locker_id = locker_id;
		this.locker_startdate = locker_startdate;
		this.locker_enddate = locker_enddate;
		this.locker_name = locker_name;
		this.locker_phone = locker_phone;
		this.locker_email = locker_email;
	}

	public Integer getLocker_no() {
		return locker_no;
	}

	public void setLocker_no(Integer locker_no) {
		this.locker_no = locker_no;
	}

	public String getLocker_use() {
		return locker_use;
	}

	public void setLocker_use(String locker_use) {
		this.locker_use = locker_use;
	}

	public Integer getMember_no() {
		return member_no;
	}

	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}

	public String getLocker_id() {
		return locker_id;
	}

	public void setLocker_id(String locker_id) {
		this.locker_id = locker_id;
	}

	public String getLocker_startdate() {
		return locker_startdate;
	}

	public void setLocker_startdate(String locker_startdate) {
		this.locker_startdate = locker_startdate;
	}

	public String getLocker_enddate() {
		return locker_enddate;
	}

	public void setLocker_enddate(String locker_enddate) {
		this.locker_enddate = locker_enddate;
	}

	public String getLocker_name() {
		return locker_name;
	}

	public void setLocker_name(String locker_name) {
		this.locker_name = locker_name;
	}

	public String getLocker_phone() {
		return locker_phone;
	}

	public void setLocker_phone(String locker_phone) {
		this.locker_phone = locker_phone;
	}

	public String getLocker_email() {
		return locker_email;
	}

	public void setLocker_email(String locker_email) {
		this.locker_email = locker_email;
	}
	
	
	
	
}
