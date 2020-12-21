package com.spring.dao;

import java.util.List;

import com.spring.dto.MemberDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

public interface MemberDAO {
	public String getTime();
	
	public List<MemberDTO> list(SearchCriteria sc) throws Exception;
	public MemberDTO read(Integer member_no) throws Exception;
	public void insertMember(MemberDTO mdto) throws Exception;
	public void updateMember(MemberDTO mdto) throws Exception;
	public void deleteMember(Integer member_no) throws Exception;
	
	public List<MemberDTO> listPaging(int page) throws Exception;
	public List<MemberDTO> listCriteria(PageCriteria pc) throws Exception;
	public int countData(PageCriteria pc) throws Exception;
	
	public List<MemberDTO> listSearch(SearchCriteria sc) throws Exception;
	public int searchCountData(SearchCriteria sc) throws Exception;
	
	// 회원 시설등록할때 기간입력 후 insert
	public List<MemberDTO> memberList(SearchCriteria sc);
	public void useinsert(MemberDTO mdto);
	public int membercount(SearchCriteria sc);
}
