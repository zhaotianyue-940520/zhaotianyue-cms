package com.zhaotianyue.cms.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.zhaotianyue.cms.condition.Constant;
import com.zhaotianyue.cms.entity.User;

public class UserInterceptor implements HandlerInterceptor{
		
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			// TODO Auto-generated method stub
			User loginUser = (User)request.getSession().getAttribute(Constant.ONLYUSER);
			if(loginUser == null)
			{
				//request.s
				response.sendRedirect("/user/register_login");
				//request.getRequestDispatcher("/user/login").forward(request, response);
				return false;
			}
			
			//放行 
			return true;
			
			
		}
		
	}
