package com.spring.dao;

import com.spring.dto.MemberDTO;

//DUser 테이블 SQL 작업하는 메소드 소유 인터페이스

public interface LoginDAO {

	// 1. 로그인
	// 사용자가 입력한 id와 pw를 매개 변수로 일치하면 테이블에 정보 리턴
	public MemberDTO login(MemberDTO mdto);

	// 2. 회원 가입
	public int register(MemberDTO mdto);

	// 2-2. 아이디 중복체크 - 아이디를 입력해서 있으면 아이디를 리턴
	public String idCheck(String member_id);

	// 3. 회원 탈퇴
	public int deleteUser(String member_id);

	
	// - 회원 정보(비밀번호) 수정 작업 -> 아이디는 수정 불가

}