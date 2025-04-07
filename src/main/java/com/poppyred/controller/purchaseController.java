package com.poppyred.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poppyred.domain.CartVo;
import com.poppyred.domain.MenuVo;
import com.poppyred.domain.PurchaseVo;
import com.poppyred.domain.UserVo;
import com.poppyred.mapper.PurchaseMapper;
import com.poppyred.service.CartService;
import com.poppyred.service.MenuService;
import com.poppyred.service.PurchaseService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class purchaseController {
	
	private final CartService cartService;
	private final MenuService menuService;
	private final PurchaseService purchaseService;

    
	@GetMapping("/purchase")
	public String purchase(@RequestParam String id, Model model) {
		List<CartVo> list = cartService.cartList(id);
		for(CartVo alist : list) {
			MenuVo vo = cartService.findMenu(alist.getPro_code());
			vo.setMenuAttachVo(menuService.getAttach(alist.getPro_code()));
			alist.setMvo(vo);
		}
		
		model.addAttribute("plist", list);
		return "/purchase/purchase";
	}
	
	@PostMapping("/purchase")
	@ResponseBody
	public void buy(@RequestBody PurchaseVo vo) {
		purchaseService.buy(vo);
	}
	
	@GetMapping("/done")
	public String purDone() {
		return "/purchase/done";
	}
}
