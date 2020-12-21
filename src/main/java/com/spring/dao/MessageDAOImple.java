package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.MemberDTO;
import com.spring.dto.MessageDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

@Repository
public class MessageDAOImple implements MessageDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<MessageDTO> list(SearchCriteria sc) {
		return sqlSession.selectList("messageDAO_list", sc);
	}

	@Override
	public MessageDTO read(Integer message_no) {
		return sqlSession.selectOne("messageDAO_read", message_no);
	}

	@Override
	public void insert(MessageDTO mdto) {
		sqlSession.insert("messageDAO_insert", mdto);
	}

	@Override
	public void update(MessageDTO mdto) {
		sqlSession.update("messageDAO_update", mdto);
	}

	@Override
	public void delete(Integer message_no) {
		sqlSession.delete("messageDAO_delete", message_no);
	}

	@Override
	public List<MessageDTO> listPaging(int page) {
		
		if(page <= 0) {
			page = 1;
		}
		
		page = (page -1) * 10;
		
		return sqlSession.selectList("messageDAO_listPaging", page);
	}

	@Override
	public List<MessageDTO> listCrieria(PageCriteria pc) {
		return sqlSession.selectList("messageDAO_listCrieria", pc);
	}

	@Override
	public int countData(PageCriteria pc) {
		return sqlSession.selectOne("messageDAO_countData", pc);
	}

	@Override
	public List<MessageDTO> listSearch(SearchCriteria sc) {
		return sqlSession.selectList("messageDAO_listSearch", sc);
	}

	@Override
	public int searchCountData(SearchCriteria sc) {
		return sqlSession.selectOne("messageDAO_searchCountData", sc);
	}

	@Override
	public List<MemberDTO> memberList(SearchCriteria sc) {
		return sqlSession.selectList("memberDAO_read", sc);
	}

	@Override
	public int membercountData(SearchCriteria sc) {
		return sqlSession.selectOne("memberDAO_membercountData", sc);
	}

	@Override
	public List<MessageDTO> sendList(SearchCriteria sc) {
		return sqlSession.selectList("messageDAO_sendList", sc);
	}

	@Override
	public int sendCountData(SearchCriteria sc) {
		return sqlSession.selectOne("messageDAO_sendCountData", sc);
	}

	@Override
	public MessageDTO sendread(MessageDTO mdto) {
		return sqlSession.selectOne("messageDAO_sendread", mdto);
	}

}
