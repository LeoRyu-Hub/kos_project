package com.kos.vo.common;

import lombok.Data;

@Data
public class PageVO {
	private int total;	//조회된 데이터 총 갯수
	private int countPerPage=9; //페이지당 조회 데이터 수
	private int currentPage=1 ; //현재 페이지번호
	private int startPage ;	//시작 페이지
	private int endPage;	//종료 페이지
	private int rn;

	public int getStartPage() {
		return currentPage/countPerPage+1;		//시작페이지 계산
	}
	
	public int getEndPage() {
		return total/countPerPage+1;			//종료페이지 계산
	}
	
	
	
}
