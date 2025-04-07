package com.poppyred.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.domain.MenuAttachVo;
import com.poppyred.domain.MenuVo;
import com.poppyred.domain.ReviewVo;

@Mapper
public interface MenuMapper {

	public Integer saveMenu(MenuVo vo); //메뉴 저장
	public List<MenuVo> getMenu(); //메뉴 불러오기
	public List<MenuVo> getBest(); //베스트메뉴 불러오기
	public List<MenuVo> getMenuDrink();//드링크만
	public List<MenuVo> getMenuDesert();//디저트만
	public List<MenuVo> getMenuGoods();//굿즈만
}
