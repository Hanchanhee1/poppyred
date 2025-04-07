package com.poppyred.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.annotation.RequestScope;

import com.poppyred.domain.EventAttachVo;
import com.poppyred.domain.MenuVo;
import com.poppyred.domain.ReviewVo;
import com.poppyred.service.EventService;
import com.poppyred.service.MenuService;
import com.poppyred.service.ShopService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	private final MenuService menuService;
	private final ShopService shopService;
	private final EventService eventService;
	
	@GetMapping({"/","/main"})
	public String main(Model model) {
		List<MenuVo> blist = menuService.getBest();
		List<MenuVo> slist = menuService.getMenu();
		List<EventAttachVo> elist = eventService.attachlist();
		model.addAttribute("blist",blist);
		model.addAttribute("slist",slist);
		model.addAttribute("elist",elist);
		return "/main";
	}
	
	@GetMapping("/menu")
	public String menu(Model model) {
		List<MenuVo> list = menuService.getMenu();
		List<MenuVo> drlist = menuService.getMenuDrink();
		List<MenuVo> delist = menuService.getMenuDesert();
		List<MenuVo> glist = menuService.getMenuGoods();
		model.addAttribute("list",list);
		model.addAttribute("drlist",drlist);
		model.addAttribute("delist",delist);
		model.addAttribute("glist",glist);
		return "/menu/menu";
	}
	
	@GetMapping("/menu/detail/{pro_code}")
	public @ResponseBody MenuVo menuDetail(@PathVariable String pro_code) {
		MenuVo vo = shopService.getDetail(pro_code);
		return vo;
	}
	
	@GetMapping("/shop")
	public String shop(Model model) {
		List<MenuVo> list = menuService.getMenu();
		List<MenuVo> drlist = menuService.getMenuDrink();
		List<MenuVo> delist = menuService.getMenuDesert();
		List<MenuVo> glist = menuService.getMenuGoods();
		model.addAttribute("list",list);
		model.addAttribute("drlist",drlist);
		model.addAttribute("delist",delist);
		model.addAttribute("glist",glist);
		return "/shop/shop";
	}
	
	@GetMapping("/shop/shopdetail")
	public String detail(@RequestParam("pro_code") String pro_code, Model model) {
		MenuVo vo = shopService.getDetail(pro_code);
		model.addAttribute("vo",vo);
		return "/shop/shopdetail";
	}
	@GetMapping("/help")
	public String help() {
		return "/help/help";
	}

}
