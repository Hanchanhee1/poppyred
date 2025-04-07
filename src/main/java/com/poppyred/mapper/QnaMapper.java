package com.poppyred.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.poppyred.domain.QnaVo;

@Mapper
public interface QnaMapper {
	void qnaSave(QnaVo vo);
	List<QnaVo> getQna(String pro_code); //qna 리스트 출력
	void answerUpdate(QnaVo vo); //답변 등록
}
