package com.poppyred.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.common.Criteria;
import com.poppyred.domain.EventAttachVo;
import com.poppyred.domain.EventVo;

@Mapper
public interface EventMapper {
	
	// 이벤트 글쓰기
	public int EventInsert(EventVo vo);
	// 이벤트 어태치 입력 ( 이미지 입력 )
	public void EventAttachInsert(EventAttachVo vo);
	// 이벤트 전체 목록
	public List<EventVo> EventAllSelect();
	// 이벤트 어태치 목록 ( 이미지 목록 )
	public List<EventAttachVo> EvnetAttachAllSelete(int bno);
	// 이벤트 목록 띄우기 + 페이징
	public List<EventVo> getListWithPaging(Criteria cri);
	// 이벤트 한개 목록
	public EventVo EventOneSelect(int bno);
	// 이벤트 삭제
	public void EvnetDelete(int bno);
	// 이벤트 어태치 삭제 ( 이미지 삭제 )
	public void EvnetAttachDelete(int bno);

}
