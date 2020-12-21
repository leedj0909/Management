package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.MemoDAO;
import com.spring.dto.MemoDTO;

@Service
public class MemoServiceImple implements MemoService{
	
	@Inject
	private MemoDAO mdao;

	@Override
	public List<MemoDTO> getMemo(MemoDTO mdto) throws Exception {
		return mdao.getMemo(mdto);
	}

	@Override
	public int addMemo(MemoDTO mdto) throws Exception {
		int result = mdao.addMemo(mdto);
		return result;
	}

	@Override
	public void insertMemo(MemoDTO memoDTO) {
		mdao.insertMemo(memoDTO);
	}

	@Override
	public List<MemoDTO> findmemoList(MemoDTO memoDTO) {
		return mdao.findmemoList(memoDTO);
	}

}
