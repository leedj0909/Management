package com.spring.dao;

import java.util.List;

import com.spring.dto.BoardDTO;
import com.spring.dto.PageCriteria;
import com.spring.dto.SearchCriteria;

public interface BoardDAO {
	public List<BoardDTO> list(SearchCriteria sc) throws Exception;
	public BoardDTO read(Integer board_no) throws Exception;
	public void insert(BoardDTO bdto) throws Exception;
	public void update(BoardDTO bdto) throws Exception;
	public void delete(Integer board_no) throws Exception;
	
	public List<BoardDTO> listPaging(int page) throws Exception;
	public List<BoardDTO> listCrieria(PageCriteria pc) throws Exception;
	public int countData(PageCriteria pc) throws Exception;
	
	public List<BoardDTO> listSearch(SearchCriteria sc) throws Exception;
	public int searchCountData(SearchCriteria sc) throws Exception;
	
	public void board_readcnt(Integer board_no);
	
	public List<BoardDTO> personListSearch(SearchCriteria sc);
	public int personSearchCountData(SearchCriteria sc);
	
	public List<BoardDTO> mainList(SearchCriteria sc);
	
	
}
