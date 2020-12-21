package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.CommentDAO;
import com.spring.dto.CommentDTO;

@Service
public class CommentSeriviceImple implements CommentService{
	
	@Inject
	private CommentDAO cdao;
	
	@Override
	public List<CommentDTO> listComment(Integer board_no) throws Exception {
		return cdao.coList(board_no);
	}

	@Override
	public void writeComment(CommentDTO cdto) throws Exception {
		cdao.coWrite(cdto);
	}

	@Override
	public void modifyComment(CommentDTO cdto) throws Exception {
		cdao.coModify(cdto);
	}

	@Override
	public void deleteComment(Integer comment_no) throws Exception {
		cdao.coDelete(comment_no);
	}

	@Override
	public int commentCount(Integer comment_no) throws Exception {
		return cdao.commentCount(comment_no);
	}
	
}
