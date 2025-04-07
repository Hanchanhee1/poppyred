package com.poppyred.domain;

import java.util.Date;

import lombok.Data;

@Data
public class HelpVo {
	
	private int bno;
	private String title;
	private String contents;
	private String answer;
	private Date rdate;

}
