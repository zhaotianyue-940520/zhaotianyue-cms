package com.zhaotianyue.cms.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.zhaotianyue.cms.condition.Constant;
import com.zhaotianyue.cms.entity.User;
import com.zhaotianyue.cms.service.UserService;

public class UserInterceptor implements HandlerInterceptor{
		@Autowired
		UserService us;
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			// TODO Auto-generated method stub
			User loginUser = (User)request.getSession().getAttribute(Constant.ONLYUSER);
			if(loginUser == null)
			{
				User user = new User();
				Cookie[] cookies = request.getCookies();
				for (int i = 0; i < cookies.length; i++) {
					if("username".equals(cookies[i].getName())){
						user.setUsername(cookies[i].getValue());
					}
					if("userpwd".equals(cookies[i].getName())){
						user.setPassword(cookies[i].getValue());
					}
				}
				
				// 说明cookie中存放的用户信息不完整
				if(null==user.getUsername() || null== user.getPassword()) {
					//request.s
					response.sendRedirect("/user/login");
					//request.getRequestDispatcher("/user/login").forward(request, response);
					return false;
				}
				
				// 利用cookie中用户信息进行登录操作
				loginUser = us.onlyUser(user);
				if(loginUser!=null) {
					request.getSession().setAttribute(Constant.ONLYUSER, loginUser);
					return true;
				}
				//request.s
				response.sendRedirect("/user/register_login");
				//request.getRequestDispatcher("/user/login").forward(request, response);
				return false;
			}
			
			//放行 
			return true;
			
			
		}
		
	}
