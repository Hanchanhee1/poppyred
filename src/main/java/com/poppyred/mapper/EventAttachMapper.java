package com.poppyred.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.domain.EventAttachVo;

@Mapper
public interface EventAttachMapper {
	
	// 첨부파일 입력
	public void insert(EventAttachVo vo);
	
	// 첨부파일 검색
	public List<EventAttachVo> selectImage(int bno);
	
	// 첨부파일 삭제
	public void attachdelete(int bno);
	
	public List<EventAttachVo> attachlist();

}
