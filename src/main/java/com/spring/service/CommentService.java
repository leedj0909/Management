package com.spring.service;

import java.util.List;

import com.spring.dto.CommentDTO;

public interface CommentService {
	public List<CommentDTO> listComment(Integer board_no) throws Exception;
	public void writeComment(CommentDTO cdto) throws Exception;
	public void modifyComment(CommentDTO cdto) throws Exception;
	public void deleteComment(Integer comment_no) throws Exception;
	public int commentCount(Integer comment_no) throws Exception;
}
