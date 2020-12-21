package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.LockerDAO;
import com.spring.dto.LockerDTO;
import com.spring.dto.SearchCriteria;

@Service
public class LockerServiceImple implements LockerService {
	
	@Inject
	private LockerDAO ldao;

	@Override
	public List<LockerDTO> list(SearchCriteria sc) {
		return ldao.list(sc);
	}

	@Override
	public LockerDTO read(Integer locker_no) {
		return ldao.read(locker_no);
	}

	@Override
	public void updateLocker(LockerDTO ldto) {
		ldao.updateLocker(ldto);
	}

	@Override
	public List<LockerDTO> listSearch(SearchCriteria sc) {
		return ldao.listSearch(sc);
	}

	@Override
	public int searchCount(SearchCriteria sc) {
		return ldao.searchCount(sc);
	}

	@Override
	public void insertLocker(LockerDTO ldto) {
		ldao.insertLocker(ldto);
	}

	@Override
	public void modifyLocker(LockerDTO ldto) {
		ldao.modifyLocker(ldto);
	}

	@Override
	public int countLocker(LockerDTO ldto) {
		return ldao.countLocker(ldto);
	}

}
