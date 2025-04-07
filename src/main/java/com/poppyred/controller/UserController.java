package com.poppyred.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.poppyred.common.MailSendRunner;
import com.poppyred.domain.UserVo;
import com.poppyred.service.JoinService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
   
   private final MailSendRunner mailSendRunner;
   private final JoinService joinService;
   
   
   @GetMapping("/members")//얘를 실행해라(redirect:/members)
   public String memberForm() {
      return "/user/joinup";
   }
   
   String code="";
   
   @GetMapping("/sendmail")
   @ResponseBody
   public String sendMail(String email) {
      code = mailSendRunner.sendMail(email);
      return code;
   }
   
   @GetMapping("/join")
   public String joinUp(String incode, Model model) {
      if(code.equals(incode)) {
         model.addAttribute("codeCheck", "ok");
         code="";
         return "/user/joinup";
      }else {
         code="";
         return "redirect:/members";
      }
   }
   
   @PostMapping("/membercount")
   public @ResponseBody int getFindUsername(@RequestParam String username) {
      return joinService.countByLoginId(username);
   }
   
   @PostMapping("/join")
   public String joinUp(UserVo vo, Model model) {
      joinService.saveMember(vo);
      return "redirect:/";
   }
   
   @GetMapping("/login")
   public String login() {
	   return "/user/login";
   }
   
   @PostMapping("/login")
   public String loginup(@RequestParam String id, @RequestParam String pw, HttpServletRequest request) {
	   UserVo vo = joinService.login(id, pw);
	   if(vo != null) {
		   HttpSession session = request.getSession();
		   session.setAttribute("user", vo);
		   return "redirect:/";
		   
	   } else {
		   request.setAttribute("msg", "ID及びパスワードを確認してください。");
		   return "/user/login";
	   }
   }
   
   @GetMapping("/pwfind")
   public String pwfind() {
	   
	   return "/user/pwfind";
   }
   
   @PostMapping("/pwfind")
   @ResponseBody
   public String pwfind(@RequestBody UserVo vo,Model model) {
	   String pw = joinService.pwfind(vo);
	   return pw;
   }
   
   @GetMapping("/logout")
   public String logout(HttpServletRequest request) {
	   HttpSession session = request.getSession();
	   session.removeAttribute("user");
	   session.invalidate();
	   return "redirect:/";
   }
   
   @PostMapping("/deleteuser")
   public String deleteUser(@RequestParam String id, @RequestParam String pw ,HttpServletRequest request) {
	   joinService.deleteUser(id, pw);
	   HttpSession session = request.getSession();
	   session.removeAttribute("user");
	   session.invalidate();
	   return "redirect:/";
   }
}