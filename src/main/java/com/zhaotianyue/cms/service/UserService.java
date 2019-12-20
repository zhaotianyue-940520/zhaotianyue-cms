package com.zhaotianyue.cms.service;

import javax.validation.Valid;

import com.zhaotianyue.cms.entity.User;

public interface UserService {

	User isHasName(String username);

	boolean add(@Valid User u);

	User onlyUser(User u);

}
