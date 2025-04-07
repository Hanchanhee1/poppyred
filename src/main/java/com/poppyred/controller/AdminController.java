package com.poppyred.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poppyred.common.FileUploadUtil;
import com.poppyred.domain.MenuAttachVo;
import com.poppyred.domain.MenuVo;
import com.poppyred.service.MenuService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	
	private final MenuService menuService;
	private final FileUploadUtil fileUploadUtil;
	
	@GetMapping("/admin")
	public String admin(Model model) {
		List<MenuVo> list = menuService.getMenu();
		model.addAttribute("list", list);
		return "/admin/admin";
	}
	
	@PostMapping("/uploadmenu")
	public String uploadmenu(MenuVo vo,@RequestParam("uploadfile") MultipartFile uploadfile) {
		MenuAttachVo attachvo = fileUploadUtil.uploadFiles(uploadfile);
		vo.setMenuAttachVo(attachvo);
		menuService.savemenu(vo);
		return "redirect:/admin";
	}
}
