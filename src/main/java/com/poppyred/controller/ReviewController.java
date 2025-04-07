package com.poppyred.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.poppyred.domain.ReviewVo;
import com.poppyred.service.ShopService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ReviewController {
	
	private final ShopService shopService;

	@PostMapping("/rwrite")
	public @ResponseBody String reviewSave(@RequestBody ReviewVo vo) {
		shopService.ReviewSave(vo);
		return "ok";
	}
	@GetMapping("/shop/shopdetail/{pro_code}")
	public @ResponseBody Map<String, Object> getList(@PathVariable String pro_code) {
		System.out.println(">>>>> " + pro_code);
		List<ReviewVo> list = shopService.getReview(pro_code);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}
	
	@DeleteMapping("/shop/{com_no}")
	public void getRemove(@PathVariable int com_no) {
		shopService.getRemove(com_no);
	}
}
