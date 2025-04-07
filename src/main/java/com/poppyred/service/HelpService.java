package com.poppyred.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poppyred.domain.HelpVo;
import com.poppyred.mapper.HelpMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HelpService {
	
	private final HelpMapper helpMapper;
	
	public void HelpInsert(HelpVo vo) {
		helpMapper.HelpInsert(vo);
	}
	
	public List<HelpVo> HelpAllSelect() {
		List<HelpVo> list = helpMapper.HelpAllSelect();
		return list;
	}
	
	public HelpVo HelpOneSelect(int bno) {
		HelpVo vo = helpMapper.HelpOneSelect(bno);
		return vo;
	}
	
	public HelpVo nextList(int bno) {
		HelpVo vo = helpMapper.nextNotice(bno);
		return vo;
	}
	
	public HelpVo prevList(int bno) {
		HelpVo vo = helpMapper.prevNotice(bno);
		return vo;
	}
	
	public int HelpUpdate(HelpVo vo) {
		return helpMapper.HelpUpdate(vo);
	}
	
	public void HelpDelete(int bno) {
		helpMapper.HelpDelete(bno);
	}

}
