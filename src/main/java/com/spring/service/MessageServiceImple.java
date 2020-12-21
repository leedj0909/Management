package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.MessageDAO;
import com.spring.dto.MemberDTO;
import com.spring.dto.MessageDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

@Service
public class MessageServiceImple implements MessageService{
	
	@Inject
	private MessageDAO mdao;

	@Override
	public List<MessageDTO> list(SearchCriteria sc) {
		return mdao.list(sc);
	}

	@Override
	public MessageDTO read(Integer message_no) {
		return mdao.read(message_no);
	}

	@Override
	public void writer(MessageDTO mdto) {
		mdao.insert(mdto);
	}

	@Override
	public void modify(MessageDTO mdto) {
		mdao.update(mdto);
	}

	@Override
	public void delete(Integer message_no) {
		mdao.delete(message_no);
	}

	@Override
	public List<MessageDTO> listCriteria(PageCriteria pc) {
		return mdao.listCrieria(pc);
	}

	@Override
	public int listCountDate(PageCriteria pc) {
		return mdao.countData(pc);
	}

	@Override
	public List<MessageDTO> listSearch(SearchCriteria sc) {
		return mdao.listSearch(sc);
	}

	@Override
	public int searchCountDate(SearchCriteria sc) {
		return mdao.searchCountData(sc);
	}

	@Override
	public List<MemberDTO> memberList(SearchCriteria sc) {
		return mdao.memberList(sc);
	}

	@Override
	public int membercountData(SearchCriteria sc) {
		return mdao.membercountData(sc);
	}

	@Override
	public List<MessageDTO> sendList(SearchCriteria sc) {
		return mdao.sendList(sc);
	}

	@Override
	public int sendCountData(SearchCriteria sc) {
		return mdao.sendCountData(sc);
	}

	@Override
	public MessageDTO sendread(MessageDTO mdto) {
		return mdao.sendread(mdto);
	}

}
