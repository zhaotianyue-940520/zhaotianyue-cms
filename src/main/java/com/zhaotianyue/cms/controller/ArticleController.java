package com.zhaotianyue.cms.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.zhaotianyue.cms.condition.CmsError;
import com.zhaotianyue.cms.condition.CmsMessage;
import com.zhaotianyue.cms.condition.Constant;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Comment;
import com.zhaotianyue.cms.entity.Complain;
import com.zhaotianyue.cms.entity.User;
import com.zhaotianyue.cms.service.ArticleService;
import com.zhaotianyue.cms.utils.StringUtils;

@Controller
@RequestMapping("article")
public class ArticleController extends BaseController{
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
	//complain
	
	/**
	 * 跳转到投诉的页面
	 * @param request
	 * @param articleId
	 * @return
	 */
	@RequestMapping(value="complain",method=RequestMethod.GET)
	public String complain(HttpServletRequest request,int articleId) {
		Article article= as.getById(articleId);
		request.setAttribute("article", article);
		Complain complain = new Complain();
		request.setAttribute("complain", complain);
		complain.setArticleId(article.getId());
		return "article/complain";
				
	}
	
	/**
	 * 接受投诉页面提交的数据
	 * @param request
	 * @param articleId
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="complain",method=RequestMethod.POST)
	public String complain(HttpServletRequest request,
			@ModelAttribute("complain") @Valid Complain complain,BindingResult result,
			MultipartFile file
			) throws IllegalStateException, IOException {
		if(!StringUtils.isHttpUrl(complain.getSrcUrl())) {
			result.rejectValue("srcUrl", "", "不是合法的url地址");
		}
		if(result.hasErrors()) {
			
			return "article/complain";
		}
		
		User loginUser  =  (User)request.getSession().getAttribute(Constant.ONLYUSER);
		
		String picUrl = this.processFile(file);
		complain.setPicture(picUrl);
		
		
		//加上投诉人
		if(loginUser!=null)
			complain.setUserId(loginUser.getId());
		else
			complain.setUserId(0);
		
		as.addComplian(complain);
		
		return "redirect:/article/detail?id="+complain.getArticleId();
				
	}
	
	//complains?articleId
	@RequestMapping("complains")
	public String 	complains(HttpServletRequest request,int articleId,
			@RequestParam(defaultValue="1") int page) {
		PageInfo<Complain> complianPage=   as.getComplains(articleId, page);
		request.setAttribute("complianPage", complianPage);
		return "article/complainslist";
	}
}
