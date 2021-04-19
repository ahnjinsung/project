package com.maet.paging;

import lombok.Data;

@Data //게터세터 자동생성
public class Criteria { //DB로 전송될 클래스

	private int pageNum; //현재 조회하는 페이지 번호
	private int amount; //한 페이지에서 몇개의 데이터를 보여줄 것인가
	
	public Criteria() { //첫 페이지 진입시 생성될 생성자
		this(1, 10);
	}
	public Criteria(int pageNum, int amount) {//페이지번호를 클릭시 실행될 생성자
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
}
