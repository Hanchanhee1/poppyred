package com.poppyred.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poppyred.domain.HelpVo;
import com.poppyred.service.HelpService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HelpController {
	
	private final HelpService helpService;
	
	@GetMapping("/helplist")
	public String HelpList(Model model) {
		List<HelpVo> list = helpService.HelpAllSelect();
		model.addAttribute("helplist",list);
		return "/help/help";
	}
	
	@GetMapping("/helpview")
	public String helpView(@RequestParam("bno") int bno, Model model) {
		HelpVo vo = helpService.HelpOneSelect(bno);
		HelpVo nextvo = helpService.nextList(bno);
		HelpVo prevo = helpService.prevList(bno);
		model.addAttribute("view",vo);
		model.addAttribute("nextvo",nextvo);
		model.addAttribute("prevo",prevo);
		return "help/helpview";
	}
	
	@GetMapping("/helpwirte")
	public String helpWrite() {
		return "help/helpwrite";
	}
	
	@PostMapping("/helpwrite")
	public String helpWrite2(HelpVo vo) {
		helpService.HelpInsert(vo);
		return "redirect:/helplist";
	}
	
	@GetMapping("/helpdelete")
	public String helpDelete(int bno) {
		helpService.HelpDelete(bno);
		return "redirect:/helplist";
	}
	
	@GetMapping("/helpmodify")
	public String helpModify(@RequestParam("bno") int bno, Model model) {
		HelpVo vo = helpService.HelpOneSelect(bno);
		model.addAttribute("modify",vo);
		return "/help/helpmodify";
	}
	
	@PostMapping("helpupdate")
	public String helpUpdate(HelpVo vo) {
		helpService.HelpUpdate(vo);
		return "redirect:/helplist";
	}

}
