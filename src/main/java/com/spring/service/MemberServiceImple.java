package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.dto.MemberDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

@Service
public class MemberServiceImple implements MemberService{
	
	@Inject
	private MemberDAO mdao;

	@Override
	public List<MemberDTO> list(SearchCriteria sc) throws Exception {
		return mdao.list(sc);
	}

	@Override
	public MemberDTO read(Integer member_no) throws Exception {
		return mdao.read(member_no);
	}

	@Override
	public void writer(MemberDTO mdto) throws Exception {
		mdao.insertMember(mdto);
	}

	@Override
	public void modify(MemberDTO mdto) throws Exception {
		mdao.updateMember(mdto);
	}

	@Override
	public void remove(Integer member_no) throws Exception {
		mdao.deleteMember(member_no);
	}

	@Override
	public List<MemberDTO> listCriteria(PageCriteria pc) throws Exception {
		return mdao.listCriteria(pc);
	}

	@Override
	public int listCountData(PageCriteria pc) throws Exception {
		return mdao.countData(pc);
	}

	@Override
	public List<MemberDTO> listSearch(SearchCriteria sc) throws Exception {
		return mdao.listSearch(sc);
	}

	@Override
	public int searchCountData(SearchCriteria sc) throws Exception {
		return mdao.searchCountData(sc);
	}

	@Override
	public void useinsert(MemberDTO mdto) {
		mdao.useinsert(mdto);
	}

	@Override
	public List<MemberDTO> memberList(SearchCriteria sc) {
		return mdao.memberList(sc);
	}

	@Override
	public int membercount(SearchCriteria sc) {
		return mdao.membercount(sc);
	}

}
