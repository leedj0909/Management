package com.spring.service;

import com.spring.dto.MemberDTO;

public interface LoginService {
	
		// 1. 로그인
		public MemberDTO login(MemberDTO mdto);

		// 2. 아이디 중복 체크 - 중복이면 false, 아니면 true
		public boolean idCheck(String member_id);

		// 3. 회원 가입
		public int register(MemberDTO mdto);

		// 6. 회원 탈퇴
		public int deleteUser(String member_id);

	
}
