package com.poppyred.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poppyred.common.Criteria;
import com.poppyred.domain.NoticeVo;
import com.poppyred.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeService {
	
	private final NoticeMapper noticeMapper;
	
	// 공지사항 글 저장
	public void noticesave(NoticeVo vo) {
		noticeMapper.NoticeInsert(vo);
	}
	
	// 공지사항 전체 출력
	public List<NoticeVo> noticelist() {
		List<NoticeVo> list = noticeMapper.NoticeAllSelect();
		return list;
	}
	
	// 공지사항 페이징 처리
	public List<NoticeVo> noticepaging(Criteria cri) {
		List<NoticeVo> list = noticeMapper.getListWithPaging(cri);
		return list;
	}
	
	// 공지사항 삭제
	public void noticedelete(Long bno) {
		noticeMapper.NoticeDelete(bno);
	}
	
	// 공지사항 한개 출력
	public NoticeVo noticeonelist(Long bno) {
		NoticeVo vo = noticeMapper.NoticeOneSelect(bno);
		return vo;
	}
	
	// 공지사항 수정
	public Integer noticeupdate(NoticeVo vo) {
		return noticeMapper.NoticeUpdate(vo);
	}
	
	// 공지사항 다음글
	public NoticeVo nextList(Long bno) {
		NoticeVo vo = noticeMapper.nextNotice(bno);
		return vo;
	}
	
	// 공지사항 이전글
	public NoticeVo prevList(Long bno) {
		NoticeVo vo = noticeMapper.prevNotice(bno);
		return vo;
	}
	
	// 공지사항글 총 개수
	public int getTotal(Criteria cri) {
		return noticeMapper.getTotalCount(cri);
	}

}
