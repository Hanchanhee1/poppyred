package com.poppyred.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.domain.PurchaseVo;

@Mapper
public interface PurchaseMapper {
	void buy(PurchaseVo vo);
	List<PurchaseVo> order(String id);
}
