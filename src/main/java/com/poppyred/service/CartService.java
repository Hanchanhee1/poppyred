package com.poppyred.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poppyred.domain.CartVo;
import com.poppyred.domain.MenuVo;
import com.poppyred.mapper.CartMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartService {
	
	private final CartMapper cartMapper;
	
	public void cartSave(CartVo vo) {
		cartMapper.saveCart(vo);
	}
	
	public List<CartVo> cartList(String id) { //카트리스트
		List<CartVo> list = cartMapper.cartList(id);
		return list;
	}
	
	public MenuVo findMenu(String pro_code) {
		MenuVo vo = cartMapper.findMenu(pro_code);
		return vo;
	}
	
	public void deleteCart(String pro_code) {
		cartMapper.deleteCart(pro_code);
	}
}
