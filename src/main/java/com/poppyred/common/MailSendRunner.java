package com.poppyred.common;

import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Component
@RequiredArgsConstructor
@Log4j2
public class MailSendRunner {
   
   private final JavaMailSender mailSender;
   @Value("${spring.mail.username}") //properties 속성 값을 저장
   private String from; //보내는 사람
   
   public String sendMail(String email) {
      Random random = new Random();
      int checkNum = random.nextInt(888888)+111111;
      log.info("인증번호 >>" +checkNum);
      
      SimpleMailMessage message = new SimpleMailMessage();
      message.setFrom(from); //보내는 사람
      message.setTo(email); //받는 사람
      message.setSubject("パピーレッドの会員登録の認証メールです。");
      String content="ホームページへのご訪問ありがとうございます" +
      "認証番号は >>" +checkNum+ "です。";
      message.setText(content); //이메일 내용
      message.setSentDate(new Date()); //이메일을 보내는 날짜
      mailSender.send(message); //메일이 보내짐
      
      String num = Integer.toString(checkNum);
      
      return num;
   }
}