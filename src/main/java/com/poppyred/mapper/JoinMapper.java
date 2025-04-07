package com.poppyred.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.poppyred.domain.UserVo;

@Mapper
public interface JoinMapper {
   
   @Select("select count(*) from tbl_user where id = #{username}")
   public int countByLoginId(String username);
   
   void save(UserVo vo);
   
   UserVo login(String id, String pw);
   
   UserVo findById(String id);
   
   String pwfind(UserVo vo);
   
   void deleteUser(String id, String pw);
   
}