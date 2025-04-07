package com.poppyred.service;

import java.awt.Menu;
import java.util.List;

import org.springframework.stereotype.Service;

import com.poppyred.domain.MenuAttachVo;
import com.poppyred.domain.MenuVo;
import com.poppyred.domain.ReviewVo;
import com.poppyred.mapper.MenuAttachMapper;
import com.poppyred.mapper.MenuMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MenuService {
	
	private final MenuMapper menuMapper;
	private final MenuAttachMapper attachMapper;

	public void savemenu(MenuVo vo) { //메뉴 저장

		menuMapper.saveMenu(vo);
		MenuAttachVo attach = vo.getMenuAttachVo();
		attach.setPro_code(vo.getPro_code());
		System.out.println("vo프로코드:"+vo.getPro_code()+"vo컨텐츠"+vo.getPro_contents()+"vo네임"+vo.getPro_name()+"vo가격"+vo.getPro_price()+"사진코드"+attach.getPro_code()+"사진파일"+attach.getUploadfile()+"사진경로"+attach.getUploadpath()+"사진uuid"+attach.getUuid());
		attachMapper.insert(attach);

	}
	
	public List<MenuVo> getMenu() {
		List<MenuVo> list = menuMapper.getMenu();
		for(MenuVo vo : list) {
			String pro_code = vo.getPro_code();
			MenuAttachVo attachvo = attachMapper.getPhoto(pro_code);
			vo.setMenuAttachVo(attachvo);
		}
		
		return list;
	}
	
	public MenuAttachVo getAttach(String pro_code) { //카트 메뉴정보
		MenuAttachVo vo = attachMapper.getPhoto(pro_code);
		return vo;
	}
	
	public List<MenuVo> getMenuDrink() {
		List<MenuVo> list = menuMapper.getMenuDrink();
		for(MenuVo vo : list) {
			String pro_code = vo.getPro_code();
			MenuAttachVo attachvo = attachMapper.getPhoto(pro_code);
			vo.setMenuAttachVo(attachvo);
		}
		
		return list;
	}
	public List<MenuVo> getMenuDesert() {
		List<MenuVo> list = menuMapper.getMenuDesert();
		for(MenuVo vo : list) {
			String pro_code = vo.getPro_code();
			MenuAttachVo attachvo = attachMapper.getPhoto(pro_code);
			vo.setMenuAttachVo(attachvo);
		}
		
		return list;
	}
	public List<MenuVo> getMenuGoods() {
		List<MenuVo> list = menuMapper.getMenuGoods();
		for(MenuVo vo : list) {
			String pro_code = vo.getPro_code();
			MenuAttachVo attachvo = attachMapper.getPhoto(pro_code);
			vo.setMenuAttachVo(attachvo);
		}
		
		return list;
	}
	
	public List<MenuVo> getBest() {
		List<MenuVo> list = menuMapper.getBest();
		for(MenuVo vo : list) {
			String pro_code = vo.getPro_code();
			MenuAttachVo attachvo = attachMapper.getPhoto(pro_code);
			vo.setMenuAttachVo(attachvo);
		}
		return list;
	}

}
