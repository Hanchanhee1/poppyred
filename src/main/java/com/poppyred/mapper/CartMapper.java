package com.poppyred.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.domain.CartVo;
import com.poppyred.domain.MenuVo;

@Mapper
public interface CartMapper {
	public void saveCart(CartVo vo);
	public List<CartVo> cartList(String id); //카트리스트
	public MenuVo findMenu(String pro_code); //메뉴정보 찾기
	public void deleteCart(String pro_code);
	public void deleteAllCart(String userid);
}
