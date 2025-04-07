package com.poppyred.domain;

import lombok.Data;

@Data
public class ReviewVo {
	private String id;
	private String pro_code;
	private String contents;
	private String rdate;
	private int bno;
}
