package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.LoginDAO;
import com.spring.dto.LoginDTO;
import com.spring.dto.MemberDTO;

@Service
public class LoginServiceImple implements LoginService{
	
	@Inject
	private LoginDAO ldao;
	
	@Override
	public MemberDTO login(MemberDTO mdto) {
		return ldao.login(mdto);
	}
	
	@Override
	public int register(MemberDTO mdto) {
		return ldao.register(mdto);
	}

	@Override
	public boolean idCheck(String member_id) {
		// 1) 아이디 입력해서 리턴값 저장
		String result = ldao.idCheck(member_id);
		
		// 2) 중복 여부 확인
		if (result == null) {
			// return == null 이면 중복되는 아이디 없음
			return true;
		}
		// result 가 null이 아니면 false
			return false;
		}

	@Override
	public int deleteUser(String member_id) {
		return ldao.deleteUser(member_id);
	}


}
