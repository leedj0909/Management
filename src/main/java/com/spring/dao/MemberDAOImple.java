package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.MemberDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;
@Repository
public class MemberDAOImple implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public String getTime() {
		return sqlSession.selectOne("getTime");
	}

	@Override
	public List<MemberDTO> list(SearchCriteria sc) throws Exception {
		return sqlSession.selectList("list", sc);
	}
	@Override
	public MemberDTO read(Integer member_no) throws Exception {
		return sqlSession.selectOne("memberDAO_memberRead", member_no);
	}

	@Override
	public void insertMember(MemberDTO mdto) throws Exception {
		sqlSession.insert("insertMember", mdto);
	}

	@Override
	public void updateMember(MemberDTO mdto) throws Exception {
		sqlSession.update("memberDAO_memeberUpdate", mdto);
	}

	@Override
	public void deleteMember(Integer member_no) throws Exception {
		sqlSession.delete("deleteMember", member_no);
	}

	@Override
	public List<MemberDTO> listPaging(int page) throws Exception {
		if(page <= 0) {
			page = 1;
		}
		
		page = (page -1) * 10;
		
		return sqlSession.selectList("listPaging", page);
	}

	@Override
	public List<MemberDTO> listCriteria(PageCriteria pc) throws Exception {
		return sqlSession.selectList("listCriteria", pc);
	}

	@Override
	public int countData(PageCriteria pc) throws Exception {
		return sqlSession.selectOne("countData", pc);
	}

	@Override
	public List<MemberDTO> listSearch(SearchCriteria sc) throws Exception {
		return sqlSession.selectList("memberDAO_listSearch", sc);
	}

	@Override
	public int searchCountData(SearchCriteria sc) throws Exception {
		return sqlSession.selectOne("memberDAO_searchCountData", sc);
	}

	@Override
	public void useinsert(MemberDTO mdto) {
		sqlSession.insert("useinsert", mdto);
	}

	@Override
	public List<MemberDTO> memberList(SearchCriteria sc) {
		return sqlSession.selectList("memberDAO_memberList", sc);
	}

	@Override
	public int membercount(SearchCriteria sc) {
		return sqlSession.selectOne("membercount", sc);
	}

	
	
}
