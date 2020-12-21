package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.BoardDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

@Repository
public class BoardDAOImple implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<BoardDTO> list(SearchCriteria sc) throws Exception {
		return sqlSession.selectList("list", sc);
	}

	@Override
	public BoardDTO read(Integer board_no) throws Exception {
		return sqlSession.selectOne("read", board_no);
	}

	@Override
	public void insert(BoardDTO bdto) throws Exception {
		sqlSession.insert("insert", bdto);
	}

	@Override
	public void update(BoardDTO bdto) throws Exception {
		sqlSession.update("update", bdto);
	}

	@Override
	public void delete(Integer board_no) throws Exception {
		sqlSession.delete("delete", board_no);
	}

	@Override
	public List<BoardDTO> listPaging(int page) throws Exception {

		if(page <= 0) {
			page = 1;
		}
		
		page = (page -1) * 10;
		
		return sqlSession.selectList("listPaging", page);
	}

	@Override
	public List<BoardDTO> listCrieria(PageCriteria pc) throws Exception {
		return sqlSession.selectList("listCriteria", pc);
	}

	@Override
	public int countData(PageCriteria pc) throws Exception {
		return sqlSession.selectOne("countData", pc);
	}

	@Override
	public List<BoardDTO> listSearch(SearchCriteria sc) throws Exception {
		return sqlSession.selectList("listSearch", sc);
	}

	@Override
	public int searchCountData(SearchCriteria sc) throws Exception {
		return sqlSession.selectOne("searchCountData", sc);
	}
	
	@Override
	public List<BoardDTO> personListSearch(SearchCriteria sc) {
		return sqlSession.selectList("personListSearch", sc);
	}

	@Override
	public int personSearchCountData(SearchCriteria sc) {
		return sqlSession.selectOne("personSearchCountData", sc);
	}

	@Override
	public void board_readcnt(Integer board_no) {
		sqlSession.update("board_readcnt", board_no);
	}

	@Override
	public List<BoardDTO> mainList(SearchCriteria sc) {
		return sqlSession.selectList("mainList", sc);
	}

}
