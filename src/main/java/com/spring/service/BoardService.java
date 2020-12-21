package com.spring.service;

import java.util.List;

import com.spring.dto.BoardDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

public interface BoardService {
	public List<BoardDTO> list(SearchCriteria sc) throws Exception;
	public BoardDTO read(Integer board_no) throws Exception;
	public void writer(BoardDTO bdto) throws Exception;
	public void modify(BoardDTO bdto) throws Exception;
	public void remove(Integer board_no) throws Exception;
	
	public List<BoardDTO> listCriteria(PageCriteria pc) throws Exception;
	public int listCountData(PageCriteria pc) throws Exception;
	public List<BoardDTO> listSearch(SearchCriteria sc) throws Exception;
	public int searchCountData(SearchCriteria sc) throws Exception;
	
	public void board_readcnt(Integer board_no);
	// 개인
	public List<BoardDTO> personListSearch(SearchCriteria sc);
	public int personSearchCountData(SearchCriteria sc);
	
	public List<BoardDTO> mainList(SearchCriteria sc);
}
