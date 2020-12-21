package com.spring.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingMaker {
	private int totalData;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10;
	
	private PageCriteria cri;
	
	private void getPagingData() {
		
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		// endPage : 			(현재 페이지 번호 / 페이지 목록에 나타낼 페이지 번호 수) * 페이지 목록에 나타낼 페이지 번호 수 1/ 10 *10
		
		startPage = (endPage - displayPageNum) + 1;
		
		// 최종페이지
		int finallyEndPage = (int)(Math.ceil(totalData/(double)cri.getNumPerPage()));
		// 									(전체 데이터 / 페이지에 노출할 게시글 갯수
		
		if(endPage > finallyEndPage) {
			endPage = finallyEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage*cri.getNumPerPage() >= totalData ? false : true;
		
	}// getPagingData() end
	
	// UriComponentsBuilder를 이용한 처리
	public String makeUri(int page) {
		UriComponents uri = UriComponentsBuilder.newInstance()
							.queryParam("page", page)
							.queryParam("numPerPage", cri.getNumPerPage())
							.build();
		
		return uri.toUriString();
	}
	
	//UriComponentsbuilder - 검색 처리
		public String makeSearch(int page) {
			UriComponents uri = UriComponentsBuilder.newInstance()
								.queryParam("page", page)
								.queryParam("numPerPage", cri.getNumPerPage())
								.queryParam("searchType",((SearchCriteria) cri).getSearchType())
								.queryParam("keyword", ((SearchCriteria) cri).getKeyword())
								.build();
		return uri.toUriString();
	}

	public int getTotalData() {
		return totalData;
	}

	public void setTotalData(int totalData) {
		this.totalData = totalData;
		
		getPagingData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public PageCriteria getCri() {
		return cri;
	}

	public void setCri(PageCriteria cri) {
		this.cri = cri;
	}
	
	
}
