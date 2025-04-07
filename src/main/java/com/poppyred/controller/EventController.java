package com.poppyred.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poppyred.common.Criteria;
import com.poppyred.common.FileUploadUtil;
import com.poppyred.common.FileUploadUtil2;
import com.poppyred.common.PageDTO;
import com.poppyred.domain.EventAttachVo;
import com.poppyred.domain.EventVo;
import com.poppyred.domain.NoticeVo;
import com.poppyred.service.EventService;
import com.poppyred.service.NoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EventController {
	
	private final EventService eventService;
	private final NoticeService noticeService;
	private final FileUploadUtil fileUploadUtil;
	private final FileUploadUtil2 fileUploadUtil2;
	
	@GetMapping("/event")
	public String eventList(Criteria cri, Model model) {
		List<NoticeVo> list = noticeService.noticepaging(cri);
		List<EventVo> alist = eventService.list(cri);
		int total = noticeService.getTotal(cri);
		model.addAttribute("list",list);
		model.addAttribute("total",total);
		model.addAttribute("pagemaker", new PageDTO(cri,total));
		model.addAttribute("alist",alist);
		return"event/event";
	}
	
	@GetMapping("/eventview") 
	public String eventView(@RequestParam("bno") int bno, Model model) {
		EventVo vo = eventService.oneList(bno);
		model.addAttribute("view",vo);
		return"event/eventview";
	}
	
	@GetMapping("/eventwrite")
	public String eventWrite() {
		return "event/eventwrite";
	}
	
	@GetMapping("/eventdelete")
	public String eventdelete(int bno) {
		eventService.eventdelete(bno);
		return "redirect:/event";
	}
	
	@PostMapping("/eventwrite")
	public String eventWrite2(EventVo vo, @RequestParam("uploadfile") MultipartFile[] uploadfile) {
		List<EventAttachVo> list = fileUploadUtil2.uploadFiles(uploadfile);
		vo.setEventAttachList(list);
		eventService.save(vo);
		return "redirect:/event";
	}
	
	@GetMapping("/noticeview")
	public String noticeView(@RequestParam("bno") Long bno, Model model) {
		NoticeVo vo = noticeService.noticeonelist(bno);
		NoticeVo nextvo = noticeService.nextList(bno);
		NoticeVo prevo = noticeService.prevList(bno);
		model.addAttribute("view" , vo);
		model.addAttribute("nextvo" , nextvo);
		model.addAttribute("prevo" , prevo);
		return "event/noticeview";
	}
	
	@GetMapping("/noticewrite")
	public String noticeWrite() {
		return "event/noticewrite";
	}
	
	@PostMapping("/noticewrite")
	public String noticewritesave(NoticeVo vo) {
		noticeService.noticesave(vo);
		return "redirect:/event";
	}
	
	@GetMapping("/noticedelete")
	public String noticeDelete(Long bno) {
		noticeService.noticedelete(bno);
		return "redirect:/event";
	}
	
	// 수정 전 값 불러오기
	@GetMapping("/noticemodify")
	public String noticeModify(@RequestParam("bno") Long bno, Model model) {
		NoticeVo vo = noticeService.noticeonelist(bno);
		model.addAttribute("modify", vo);
		return "event/noticemodify";
	}
	
	@PostMapping("/noticeupdate")
	public String noticeUpdate(NoticeVo vo) {
		noticeService.noticeupdate(vo);
		return "redirect:/event";
	}
}
