package com.spring.dto;

import java.util.Date;

public class MessageDTO {
	private Integer message_no;
	private Integer message_send_no;
	private Integer message_recevice_no;
	private String message_title;
	private String message_content;
	private String message_id;
	private Date message_date;
	private String message_recevice_no_temp;
	
	public MessageDTO() {}

	public MessageDTO(Integer message_no, Integer message_send_no, Integer message_recevice_no, String message_title,
			String message_content, String message_id, Date message_date) {
		super();
		this.message_no = message_no;
		this.message_send_no = message_send_no;
		this.message_recevice_no = message_recevice_no;
		this.message_title = message_title;
		this.message_content = message_content;
		this.message_id = message_id;
		this.message_date = message_date;
	}

	public Integer getMessage_no() {
		return message_no;
	}

	public void setMessage_no(Integer message_no) {
		this.message_no = message_no;
	}

	public Integer getMessage_send_no() {
		return message_send_no;
	}

	public void setMessage_send_no(Integer message_send_no) {
		this.message_send_no = message_send_no;
	}

	public Integer getMessage_recevice_no() {
		return message_recevice_no;
	}

	public void setMessage_recevice_no(Integer message_recevice_no) {
		this.message_recevice_no = message_recevice_no;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public String getMessage_id() {
		return message_id;
	}

	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}

	public String getMessage_recevice_no_temp() {
		return message_recevice_no_temp;
	}

	public void setMessage_recevice_no_temp(String message_recevice_no_temp) {
		this.message_recevice_no_temp = message_recevice_no_temp;
	}
	
	
}
