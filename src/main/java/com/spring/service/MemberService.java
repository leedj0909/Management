package com.spring.service;

import java.util.List;

import com.spring.dto.MemberDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

public interface MemberService {
	public List<MemberDTO> list(SearchCriteria sc) throws Exception;
	public MemberDTO read(Integer member_no) throws Exception;
	public void writer(MemberDTO mdto) throws Exception;
	public void modify(MemberDTO mdto) throws Exception;
	public void remove(Integer member_no) throws Exception;
	
	public List<MemberDTO> listCriteria(PageCriteria pc) throws Exception;
	public int listCountData(PageCriteria pc) throws Exception;
	public List<MemberDTO> listSearch(SearchCriteria sc) throws Exception;
	public int searchCountData(SearchCriteria sc) throws Exception;
	
	public List<MemberDTO> memberList(SearchCriteria sc);
	public void useinsert(MemberDTO mdto);
	public int membercount(SearchCriteria sc);
}
