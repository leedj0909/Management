package com.spring.dao;

import java.util.List;

import com.spring.dto.CommentDTO;

public interface CommentDAO {
	public List<CommentDTO> coList(Integer board_no) throws Exception;
	public void coWrite(CommentDTO cdto) throws Exception;
	public void coModify(CommentDTO cdto) throws Exception;
	public void coDelete(Integer comment_no) throws Exception;
	public int commentCount(Integer comment_no) throws Exception;
	
	}
