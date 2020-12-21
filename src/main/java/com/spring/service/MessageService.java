package com.spring.service;

import java.util.List;

import com.spring.dto.MemberDTO;
import com.spring.dto.MessageDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

public interface MessageService {
	public List<MessageDTO> list(SearchCriteria sc);
	public MessageDTO read(Integer message_no);
	public void writer(MessageDTO mdto);
	public void modify(MessageDTO mdto);
	public void delete(Integer message_no);
	
	public List<MessageDTO> listCriteria(PageCriteria pc);
	public int listCountDate(PageCriteria pc);
	
	public List<MessageDTO> listSearch(SearchCriteria sc);
	public int searchCountDate(SearchCriteria sc);
	
	public List<MemberDTO> memberList(SearchCriteria sc);
	public int membercountData(SearchCriteria sc);
	
	public List<MessageDTO> sendList(SearchCriteria sc);
	public int sendCountData(SearchCriteria sc);
	
	public MessageDTO sendread(MessageDTO mdto);
}
