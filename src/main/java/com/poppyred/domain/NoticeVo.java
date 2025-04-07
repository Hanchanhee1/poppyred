package com.poppyred.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVo {
	
	private Long bno;
	private String title;
	private String contents;
	private Date rdate;

}
