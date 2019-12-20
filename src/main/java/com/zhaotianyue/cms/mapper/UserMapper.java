package com.zhaotianyue.cms.mapper;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zhaotianyue.cms.entity.User;

public interface UserMapper {
	@Select("select id, username, password, nickname, birthday from cms_user where username=#{username} LIMIT 1 ")
	User isHasName(@Param("username")String username);
	@Insert("INSERT INTO cms_user(username,password,locked,create_time,score,role) VALUES(#{username},#{password},0,now(),0,'0') ")
	boolean add(@Valid User u);
	@Select("select id, username, password, nickname,role, birthday from cms_user where username=#{username} and password=#{password} LIMIT 1 ")
	User onlyUser(User u);

}
