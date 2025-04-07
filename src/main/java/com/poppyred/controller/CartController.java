package com.poppyred.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.poppyred.domain.CartVo;
import com.poppyred.mapper.CartMapper;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class CartController {
	
	private final CartMapper cartMapper;
	
	@PostMapping("/cart")
	public @ResponseBody String cart(@RequestBody CartVo vo) {
		cartMapper.saveCart(vo);
		return "ok";
	}
	
	@DeleteMapping("/deleteCart/{pro_code}")
	public void deleteCart(@PathVariable String pro_code) {
		cartMapper.deleteCart(pro_code);
	}
	
}
