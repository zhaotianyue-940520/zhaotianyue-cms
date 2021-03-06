package com.zhaotianyue.cms.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zhaotianyue.cms.condition.CmsError;
import com.zhaotianyue.cms.condition.CmsMessage;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Complain;
import com.zhaotianyue.cms.entity.Link;
import com.zhaotianyue.cms.mapper.ArticleEs;
import com.zhaotianyue.cms.service.ArticleService;
import com.zhaotianyue.cms.service.LinkService;
//管理员的控制层
@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	ArticleService as;
	
	@Autowired
	ArticleEs ae;
	
	@Autowired
	LinkService ls;
	//进入管理员界面
	@RequestMapping("index")
	public String index() {
		return "admin/index";
	}
	//查看热点文章
	@RequestMapping("setArticeHot")
	@ResponseBody
	public CmsMessage setArticeHot(int id,int status) {
		/**
		 * 数据合法性校验 
		 */
		if(status !=0 && status!=1) {
			
		}
		
		if(id<0) {
			
		}
		
		Article article = as.getInfoById(id);
		if(article==null) {
			
		}
		if(article.getStatus()==status) {
			
		}
		int result = as.setHot(id,status);
		if(result<1)
			return new CmsMessage(CmsError.FAILED_UPDATE_DB,"设置失败，请稍后再试",null);
		
		
		return new CmsMessage(CmsError.SUCCESS,"成功",null);
		
	}
	
	/**
	 * 
	 * @param id
	 * @param status
	 * @return
	 */
	@RequestMapping("setArticeStatus")
	@ResponseBody
	public CmsMessage  setArticeStatus(int id,int status) {
		
		/**
		 * 数据合法性校验 
		 */
		if(status !=1 && status!=2) {
			return new CmsMessage(CmsError.NOT_VALIDATED_ARGURMENT,"status参数值不合法",null);
		}
		
		if(id<0) {
			return new CmsMessage(CmsError.NOT_VALIDATED_ARGURMENT,"id参数值不合法",null);
		}
		
		Article article = as.getInfoById(id);
		if(article==null) {
			return new CmsMessage(CmsError.NOT_EXIST,"数据不存在",null);
		}
		
		/**
		 * 
		 */
		if(article.getStatus()==status) {
			return new CmsMessage(CmsError.NEEDNT_UPDATE,"数据无需更改",null);
		}
		
		/**
		 *  修改数据
		 */
		int result = as.setCheckStatus(id,status);
		//把审核通过的数据发送给ES
		article.setStatus(status);
		ae.save(article);
		
		if(result<1)
			return new CmsMessage(CmsError.FAILED_UPDATE_DB,"设置失败，请稍后再试",null);
		
		
		return new CmsMessage(CmsError.SUCCESS,"成功",null);
		
	}
	
	@RequestMapping("article")
	public String article(HttpServletRequest request,@RequestParam(defaultValue = "-1")int status ,@RequestParam(defaultValue = "1")int page) {
		PageInfo<Article> articlePage =  as.list(status ,page);
		request.setAttribute("pg", articlePage);
		request.setAttribute("status", status);
		return "admin/article/list";
		
	}
	@RequestMapping("link")
	public String link(HttpServletRequest request, @RequestParam(defaultValue = "1") int page) {
		PageInfo<Link> articlePage = as.link(page);
		request.setAttribute("pg", articlePage);
		return "admin/article/link";
		
	}
	@RequestMapping("complain")
	public String complain(HttpServletRequest request, @RequestParam(defaultValue = "1") int page) {
		PageInfo<Complain> articlePage = as.complain(page);
		request.setAttribute("pg", articlePage);
		return "admin/article/complain";
		
	}
	@ResponseBody
	@RequestMapping("addLink")
	public CmsMessage addLink(Link l) {
		int result = ls.addLink(l);
		if(result<1)
			return new CmsMessage(CmsError.FAILED_UPDATE_DB,"设置失败，请稍后再试",null);
		
		
		return new CmsMessage(CmsError.SUCCESS,"成功",null);
	}
	@ResponseBody
	@RequestMapping("toUpd")
	public CmsMessage toUpd(HttpServletRequest request,Link l) {
		Link link = ls.toUpd(l);
		if(link==null)
			return new CmsMessage(CmsError.FAILED_UPDATE_DB,"设置失败，请稍后再试",null);
		
		
		return new CmsMessage(CmsError.SUCCESS,"成功",link);
	}
	@ResponseBody
	@RequestMapping("updLink")
	public CmsMessage updLink(Link l) {
		int result = ls.updLink(l);
		if(result<1)
			return new CmsMessage(CmsError.FAILED_UPDATE_DB,"设置失败，请稍后再试",null);
		
		
		return new CmsMessage(CmsError.SUCCESS,"成功",null);
	}
	@ResponseBody
	@RequestMapping("delLink")
	public CmsMessage delLink(Link l) {
		int result = ls.delLink(l);
		if(result<1)
			return new CmsMessage(CmsError.FAILED_UPDATE_DB,"设置失败，请稍后再试",null);
		
		
		return new CmsMessage(CmsError.SUCCESS,"成功",null);
	}
}
