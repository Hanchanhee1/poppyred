package com.poppyred.domain;

import lombok.Data;

@Data
public class MenuVo {
	private String pro_code;
	private String pro_name;
	private Long pro_price;
	private String pro_contents;
	private MenuAttachVo menuAttachVo;
}
