package com.poppyred.domain;

import lombok.Data;

@Data
public class PurchaseVo {
	private int order_bno;
	private String userid;
	private String rdate;
	private String receiver;
	private int all_price;
	private int all_amount;
	private String delivery;
	private String address;
	private String pro_name;
}
