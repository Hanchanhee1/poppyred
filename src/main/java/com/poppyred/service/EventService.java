package com.poppyred.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.stereotype.Service;

import com.poppyred.common.Criteria;
import com.poppyred.common.FileUploadUtil;
import com.poppyred.common.FileUploadUtil2;
import com.poppyred.domain.EventAttachVo;
import com.poppyred.domain.EventVo;
import com.poppyred.mapper.EventAttachMapper;
import com.poppyred.mapper.EventMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EventService {
	
	private final EventMapper eventMapper;
	private final EventAttachMapper eventAttachMapper;
	
	public void save(EventVo vo) {
			
			eventMapper.EventInsert(vo); // 텍스트 글저장
			vo.getEventAttachList().forEach(attach -> { // 람다식 for문 , 첨부내용을 저장
			attach.setBno(vo.getBno());
			eventAttachMapper.insert(attach);
				// 첨부 파일 저장
			});
		}
	
	public List<EventVo> list(Criteria cri) {
		List<EventVo> list = eventMapper.getListWithPaging(cri);
		
		for(EventVo vo : list) {
			int bno = vo.getBno();
			List<EventAttachVo> alist = eventAttachMapper.selectImage(bno);
			vo.setEventAttachList(alist);
		}
		return list;
	}
	
	public EventVo oneList(int bno) {
		EventVo vo = eventMapper.EventOneSelect(bno);
		List<EventAttachVo> alist = eventAttachMapper.selectImage(bno);
		vo.setEventAttachList(alist);
		return vo;
	}
	
	public void eventdelete(int bno) {
		FileUploadUtil2 flu = new FileUploadUtil2();
		
		List<EventAttachVo> list = eventAttachMapper.selectImage(bno);
		list.forEach(attach-> {
			Path filename = Paths.get("C:/upload/"+attach.getUploadpath()+"/"+attach.getUuid()+"/"+attach.getUploadfile());
			try {
				Files.deleteIfExists(filename);
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
		
		flu.getDeleteFile(list);
		eventAttachMapper.attachdelete(bno);
		eventMapper.EvnetDelete(bno);
		
	}
	
	public List<EventAttachVo> attachlist() {
		return eventAttachMapper.attachlist();
	}

}
