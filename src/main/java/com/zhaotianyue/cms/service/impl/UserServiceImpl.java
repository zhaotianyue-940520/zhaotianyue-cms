package com.zhaotianyue.cms.service.impl;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhaotianyue.cms.entity.User;
import com.zhaotianyue.cms.mapper.UserMapper;
import com.zhaotianyue.cms.service.UserService;
import com.zhaotianyue.cms.utils.Cms_Utils;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper um;
	//前台唯一验证姓名查询
	@Override
	public User isHasName(String username) {
		return um.isHasName(username);
	}
	//添加用户
	@Override
	public boolean add(@Valid User u) {
		u.setPassword(Cms_Utils.encrypt(u.getPassword(),u.getUsername()));
		return um.add(u);
	}
	//登录 根据姓名和密码查询用户
	@Override
	public User onlyUser(User u) {
		u.setPassword(Cms_Utils.encrypt(u.getPassword(),u.getUsername()));
		return um.onlyUser(u);
	}
}
