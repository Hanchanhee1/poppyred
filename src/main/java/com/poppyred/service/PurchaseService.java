package com.poppyred.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poppyred.domain.PurchaseVo;
import com.poppyred.mapper.CartMapper;
import com.poppyred.mapper.PurchaseMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PurchaseService {
	
	private final PurchaseMapper mapper;
	private final CartMapper cartMapper;
	
	public void buy(PurchaseVo vo) {
		cartMapper.deleteAllCart(vo.getUserid());
		mapper.buy(vo);
	}
	
	public List<PurchaseVo> order(String id){
		return mapper.order(id);
	}
	

}
