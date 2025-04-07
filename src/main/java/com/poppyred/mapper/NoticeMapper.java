package com.poppyred.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.common.Criteria;
import com.poppyred.domain.NoticeVo;

@Mapper
public interface NoticeMapper {
	
	// 공지사항 글쓰기 
	public Integer NoticeInsert(NoticeVo vo);
	// 공지사항 수정
	public Integer NoticeUpdate(NoticeVo vo);
	// 공지사항 삭제
	public void NoticeDelete(Long bno);
	// 공지사항 전체 목록
	public List<NoticeVo> NoticeAllSelect();
	// 공지사항 페이징 처리
	public List<NoticeVo> getListWithPaging(Criteria cri);
	// 공지사항 한개 목록
	public NoticeVo NoticeOneSelect(Long bno);
	// 공지사항 총 레코드 개수
	public int getTotalCount(Criteria cri);  //pageNum,amount,type,keyword
	// 공지사항 이전글
	public NoticeVo prevNotice(Long bno);
	// 공지사항 다음글
	public NoticeVo nextNotice(Long bno);

}
