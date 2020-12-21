package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.BoardDAO;
import com.spring.dto.BoardDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

@Service
public class BoardServiceImple implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public List<BoardDTO> list(SearchCriteria sc) throws Exception {
		return bdao.list(sc);
	}

	@Override
	public BoardDTO read(Integer board_no) throws Exception {
		return bdao.read(board_no);
	}

	@Override
	public void writer(BoardDTO bdto) throws Exception {
		bdao.insert(bdto);
	}

	@Override
	public void modify(BoardDTO bdto) throws Exception {
		bdao.update(bdto);
	}

	@Override
	public void remove(Integer board_no) throws Exception {
		bdao.delete(board_no);
	}

	@Override
	public List<BoardDTO> listCriteria(PageCriteria pc) throws Exception {
		return bdao.listCrieria(pc);
	}

	@Override
	public int listCountData(PageCriteria pc) throws Exception {
		return bdao.countData(pc);
	}

	@Override
	public List<BoardDTO> listSearch(SearchCriteria sc) throws Exception {
		return bdao.listSearch(sc);
	}

	@Override
	public int searchCountData(SearchCriteria sc) throws Exception {
		return bdao.searchCountData(sc);
	}

	@Override
	public void board_readcnt(Integer board_no) {
		bdao.board_readcnt(board_no);
	}

	@Override
	public List<BoardDTO> personListSearch(SearchCriteria sc) {
		return bdao.personListSearch(sc);
	}

	@Override
	public int personSearchCountData(SearchCriteria sc) {
		return bdao.personSearchCountData(sc);
	}

	@Override
	public List<BoardDTO> mainList(SearchCriteria sc) {
		return bdao.mainList(sc);
	}

}
