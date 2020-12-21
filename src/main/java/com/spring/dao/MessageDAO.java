package com.spring.dao;

import java.util.List;

import com.spring.dto.MemberDTO;
import com.spring.dto.MessageDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

public interface MessageDAO {
	public List<MessageDTO> list(SearchCriteria sc);
	public MessageDTO read(Integer message_no);
	public void insert(MessageDTO mdto);
	public void update(MessageDTO mdto);
	public void delete(Integer message_no);
	
	public List<MessageDTO> listPaging(int page);
	public List<MessageDTO> listCrieria(PageCriteria pc);
	public int countData(PageCriteria pc);
	
	public List<MessageDTO> listSearch(SearchCriteria sc);
	public int searchCountData(SearchCriteria sc);
	
	// 회원정보조회
	public List<MemberDTO> memberList(SearchCriteria sc);
	public int membercountData(SearchCriteria sc);
	
	// 보낸편지함
	public List<MessageDTO> sendList(SearchCriteria sc);
	public int sendCountData(SearchCriteria sc);
	
	public MessageDTO sendread(MessageDTO mdto);
	
}
