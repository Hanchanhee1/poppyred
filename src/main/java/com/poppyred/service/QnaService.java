package com.poppyred.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poppyred.domain.QnaVo;
import com.poppyred.mapper.QnaMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaService {
	
	private final QnaMapper mapper;
	
	public void qnaSave(QnaVo vo) {
		mapper.qnaSave(vo);
	}
	public List<QnaVo> getQna(String pro_code) {
		return mapper.getQna(pro_code);
	}
	public void answerUpdate(QnaVo vo) {
		mapper.answerUpdate(vo);
	}
}
