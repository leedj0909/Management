package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.LoginDTO;
import com.spring.dto.MemberDTO;

@Repository
public class LoginDAOImple implements LoginDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public MemberDTO login(MemberDTO mdto) {
		return sqlSession.selectOne("login", mdto);
	}

	@Override
	public int register(MemberDTO mdto) {
		return sqlSession.insert("register", mdto);
	}

	@Override
	public String idCheck(String member_id) {
		return sqlSession.selectOne("idCheck", member_id);
	}

	@Override
	public int deleteUser(String member_id) {
		return sqlSession.delete("deleteUser", member_id);
	}

	

	

}
