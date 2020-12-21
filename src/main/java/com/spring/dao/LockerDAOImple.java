package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.LockerDTO;
import com.spring.dto.SearchCriteria;

@Repository
public class LockerDAOImple implements LockerDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<LockerDTO> list(SearchCriteria sc) {
		return sqlSession.selectList("lockerDAO_list", sc);
	}

	@Override
	public LockerDTO read(Integer locker_no) {
		return sqlSession.selectOne("lockerDAO_read", locker_no);
	}

	@Override
	public void updateLocker(LockerDTO ldto) {
		sqlSession.update("lockerDAO_update", ldto);
	}

	@Override
	public List<LockerDTO> listSearch(SearchCriteria sc) {
		return sqlSession.selectList("lockerDAO_listSearch", sc);
	}

	@Override
	public int searchCount(SearchCriteria sc) {
		return sqlSession.selectOne("lockerDAO_searchCount", sc);
	}

	@Override
	public void insertLocker(LockerDTO ldto) {
		sqlSession.insert("insertLocker", ldto);
	}

	@Override
	public void modifyLocker(LockerDTO ldto) {
		sqlSession.update("modifyLocker", ldto);
	}

	@Override
	public int countLocker(LockerDTO ldto) {
		return sqlSession.selectOne("countLocker", ldto);
	}
	
}
