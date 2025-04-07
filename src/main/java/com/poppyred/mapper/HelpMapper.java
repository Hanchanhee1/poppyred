package com.poppyred.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.domain.HelpVo;

@Mapper
public interface HelpMapper {
	
	// 헬프 글쓰기
	public int HelpInsert(HelpVo vo);
	// 헬프 수정
	public int HelpUpdate(HelpVo vo);
	// 헬프 삭제
	public void HelpDelete(int bno);
	// 헬프 전체 목록
	public List<HelpVo> HelpAllSelect();
	// 헬프 한개 목록
	public HelpVo HelpOneSelect(int bno);
	// 헬프 이전글
	public HelpVo prevNotice(int bno);
	// 헬프 다음글
	public HelpVo nextNotice(int bno);
}
