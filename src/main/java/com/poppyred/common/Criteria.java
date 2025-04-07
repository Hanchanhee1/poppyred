package com.poppyred.common;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Criteria {
	
	private int pageNum; //페이지 번호
	private int amount; //한 페이지에 출력 레코드 개수
	private String type; //검색종류
	private String keyword; //검색단어
	private Criteria cri; //pageNum,amount,type,keyword
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

}
