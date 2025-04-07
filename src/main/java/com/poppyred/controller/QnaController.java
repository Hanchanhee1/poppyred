package com.poppyred.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.poppyred.domain.QnaVo;
import com.poppyred.service.QnaService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class QnaController {
	
	private final QnaService qnaService;
	
	@PostMapping("/qwrite")
	public @ResponseBody String qnaSave(@RequestBody QnaVo vo) {
		qnaService.qnaSave(vo);
		return "ok";
	}
	
	@GetMapping("/qna/{pro_code}")
	public @ResponseBody Map<String, Object> getList(@PathVariable String pro_code) {
		System.out.println(">>>>> " + pro_code);
		List<QnaVo> list = qnaService.getQna(pro_code);
		Map<String, Object> map = new HashMap<>();
		map.put("qlist", list);
		return map;
	}
	
	@PostMapping("/awrite")
	public @ResponseBody String qnaAnswer(@RequestBody QnaVo vo) {
		System.out.println(vo.getPro_code()+" "+vo.getAnswer());
		qnaService.answerUpdate(vo);
		return "ok";
	}
}
