package com.poppyred.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poppyred.domain.CartVo;
import com.poppyred.domain.MenuVo;
import com.poppyred.domain.PurchaseVo;
import com.poppyred.mapper.PurchaseMapper;
import com.poppyred.service.CartService;
import com.poppyred.service.MenuService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MypageContoller {
	
	private final CartService cartService;
	private final MenuService menuService;
	private final PurchaseMapper purchaseMapper;
	
	@GetMapping("/mypage")
	public String mypage(@RequestParam String id, Model model) {
		List<CartVo> list = cartService.cartList(id);
		for(CartVo alist : list) {
			MenuVo vo = cartService.findMenu(alist.getPro_code());
			vo.setMenuAttachVo(menuService.getAttach(alist.getPro_code()));
			alist.setMvo(vo);
		}
		List<PurchaseVo> olist = purchaseMapper.order(id);
		
		model.addAttribute("clist", list);
		model.addAttribute("olist", olist);
		
		return "/mypage/mypage";

	}
}
