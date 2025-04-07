package com.poppyred.domain;

import java.util.List;

import lombok.Data;

@Data
public class CartVo {
	private String id;
	private String pro_code;
	private int amount;
	private String rdate;
	private String bno;
	private int tot_price;
	private MenuVo mvo;
}
