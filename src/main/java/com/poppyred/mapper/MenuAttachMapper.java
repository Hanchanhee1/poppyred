package com.poppyred.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.domain.MenuAttachVo;

@Mapper
public interface MenuAttachMapper {
	public void insert(MenuAttachVo vo);
	
	public MenuAttachVo getPhoto(String pro_code);
}
