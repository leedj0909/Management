package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.CommentDTO;

@Repository
public class CommentDAOImple implements CommentDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CommentDTO> coList(Integer board_no) throws Exception {
		return sqlSession.selectList("coList", board_no);
	}

	@Override
	public void coWrite(CommentDTO cdto) throws Exception {
		sqlSession.insert("coWrite", cdto);
	}

	@Override
	public void coModify(CommentDTO cdto) throws Exception {
		sqlSession.update("coModify", cdto);
	}

	@Override
	public void coDelete(Integer comment_no) throws Exception {
		sqlSession.update("coDelete", comment_no);
	}

	@Override
	public int commentCount(Integer comment_no) throws Exception {
		return sqlSession.selectOne("commentCount", comment_no);
	}
	

}
