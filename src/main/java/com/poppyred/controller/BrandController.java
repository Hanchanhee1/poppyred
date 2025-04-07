package com.poppyred.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BrandController {
	
	@GetMapping("/intro")
	public String introBrand() {
		return "brand/introbrand"; 
	}
	
	@GetMapping("/map")
	public String introMap() {
		return "brand/map";
	}
	
}


