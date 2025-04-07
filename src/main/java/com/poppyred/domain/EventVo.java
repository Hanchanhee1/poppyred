package com.poppyred.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class EventVo {
	
	private int bno;
	private String title;
	private String img;
	private Date rdate;
	private List<EventAttachVo> eventAttachList;

}
