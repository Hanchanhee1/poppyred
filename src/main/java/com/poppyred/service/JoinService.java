package com.poppyred.service;

import org.springframework.stereotype.Service;
import com.poppyred.domain.UserVo;
import com.poppyred.mapper.JoinMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JoinService {
   
   private final JoinMapper joinMapper;
   
   public int countByLoginId(String id) {
      return joinMapper.countByLoginId(id);
   }

   public void saveMember(UserVo vo) {
      joinMapper.save(vo);
   }
   
   public UserVo login(String id, String pw) {
	      return joinMapper.login(id, pw);
	   }
   
   public UserVo findByLoginId(String id) {
      return joinMapper.findById(id);
   }
   
   public String pwfind(UserVo vo) {
	   return joinMapper.pwfind(vo);
   }
   
   public void deleteUser(String id, String pw) {
	   joinMapper.deleteUser(id,pw);
   }
}