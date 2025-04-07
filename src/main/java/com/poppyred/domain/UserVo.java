package com.poppyred.domain;

import lombok.Data;

@Data
public class UserVo {
	private String id;
	private String email;
	private String pw;
	private String name;
	private int question;
	private String answer;
	private String role;
}
