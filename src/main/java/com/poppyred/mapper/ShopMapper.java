package com.poppyred.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.domain.MenuVo;
import com.poppyred.domain.ReviewVo;

@Mapper
public interface ShopMapper {
	
	MenuVo getDetail(String pro_code); //특정 메뉴 불러오기
	
	void ReviewSave(ReviewVo vo); //댓글 저장
	
	List<ReviewVo> getReview(String pro_code);
	
	void getRemove(int com_no);
	
}
