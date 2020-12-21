package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.spring.dto.MemoDTO;

@Repository
public class MemoDAOImple implements MemoDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<MemoDTO> getMemo(MemoDTO mdto) throws Exception {
		return sqlSession.selectList("getMemo", mdto);
	}

	@Override
	public int addMemo(MemoDTO mdto) throws Exception {
		int count = sqlSession.insert("addMemo", mdto);
		return count;
	}

	@Override
	public void insertMemo(MemoDTO memoDTO) {
		sqlSession.insert("insertMemo", memoDTO);
	}

	@Override
	public List<MemoDTO> findmemoList(MemoDTO memoDTO) {
		return sqlSession.selectList("findmemoList", memoDTO);
	}

}	
