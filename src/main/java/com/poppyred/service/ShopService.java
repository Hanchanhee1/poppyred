package com.poppyred.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poppyred.domain.MenuAttachVo;
import com.poppyred.domain.MenuVo;
import com.poppyred.domain.ReviewVo;
import com.poppyred.mapper.MenuAttachMapper;
import com.poppyred.mapper.ShopMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShopService {
	
	private final ShopMapper shopmapper;
	private final MenuAttachMapper attachMapper;

	public MenuVo getDetail(String pro_name) {
		MenuVo vo = shopmapper.getDetail(pro_name);
		MenuAttachVo attach = attachMapper.getPhoto(vo.getPro_code());
		vo.setMenuAttachVo(attach);
		return vo;
	}
	public void ReviewSave(ReviewVo vo) {
		shopmapper.ReviewSave(vo);
	}
	public List<ReviewVo> getReview(String pro_code) {
		List<ReviewVo> list = shopmapper.getReview(pro_code);
		return list;
	}
	public void getRemove(int com_no) {
		shopmapper.getRemove(com_no);
	}
}
