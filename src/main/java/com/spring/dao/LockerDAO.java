package com.spring.dao;

import java.util.List;

import com.spring.dto.LockerDTO;
import com.spring.dto.SearchCriteria;

public interface LockerDAO {
	public List<LockerDTO> list(SearchCriteria sc);
	public LockerDTO read(Integer locker_no);
	public void updateLocker(LockerDTO ldto);
	public void insertLocker(LockerDTO ldto);
	public void modifyLocker(LockerDTO ldto);
	
	public List<LockerDTO> listSearch(SearchCriteria sc);
	public int searchCount(SearchCriteria sc);
	public int countLocker(LockerDTO ldto);
}
