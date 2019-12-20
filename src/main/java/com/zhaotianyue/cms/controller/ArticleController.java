package com.zhaotianyue.cms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zhaotianyue.cms.condition.CmsError;
import com.zhaotianyue.cms.condition.CmsMessage;
import com.zhaotianyue.cms.condition.Constant;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Comment;
import com.zhaotianyue.cms.entity.User;
import com.zhaotianyue.cms.service.ArticleService;

@Controller
@RequestMapping("article")
public class ArticleController {
	@Autowired
	ArticleService as;
	
	@RequestMapping("getDetail")
	@ResponseBody
	public CmsMessage getDetail(int id) {
		if(id<=0) {
			
		}
		// 获取文章详情
		Article article = as.getById(id);
		
		
		System.out.println(article);
		// 不存在
		if(article==null)
			return new CmsMessage(CmsError.NOT_EXIST, "文章不存在",null);
		
		// 返回数据
		return new CmsMessage(CmsError.SUCCESS,"",article); 
		
	}
	
	@RequestMapping("detail")
	public String detail(HttpServletRequest request,int id) {
		
		Article article = as.getById(id);
		request.setAttribute("article", article);
		return "detail";
	}
	
	@RequestMapping("postcomment")
	@ResponseBody
	public CmsMessage postcomment(HttpServletRequest request,int articleId,String content) {
		
		User loginUser  = (User)request.getSession().getAttribute(Constant.ONLYUSER);
		
		if(loginUser==null) {
			return new CmsMessage(CmsError.NOT_LOGIN, "您尚未登录！", null);
		}
		
		Comment comment = new Comment();
		comment.setUserId(loginUser.getId());
		comment.setContent(content);
		comment.setArticleId(articleId);
		int result = as.addComment(comment);
		if(result > 0)
			return new CmsMessage(CmsError.SUCCESS, "成功", null);
		
		return new CmsMessage(CmsError.FAILED_UPDATE_DB, "异常原因失败，请与管理员联系", null);
		
	}
	// {articleId:'${article.id}',content:$("#co
	
		//comments?id
	@RequestMapping("comments")
	public String comments(HttpServletRequest request,int id,int page) {
		PageInfo<Comment> commentPage =  as.getComments(id,page);
		request.setAttribute("commentPage", commentPage);
		return "comments";
	}
}
