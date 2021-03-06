package com.spring.service;

import java.util.List;

import com.spring.dto.MemoDTO;

public interface MemoService {
	public List<MemoDTO> getMemo(MemoDTO mdto) throws Exception;
	public int addMemo(MemoDTO mdto) throws Exception;
	public void insertMemo(MemoDTO memoDTO);
	public List<MemoDTO> findmemoList(MemoDTO memoDTO);

}
