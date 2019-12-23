package com.zhaotianyue.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhaotianyue.cms.condition.Constant;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Category;
import com.zhaotianyue.cms.entity.Channel;
import com.zhaotianyue.cms.entity.Comment;
import com.zhaotianyue.cms.entity.Complain;
import com.zhaotianyue.cms.entity.Link;
import com.zhaotianyue.cms.entity.Slide;
import com.zhaotianyue.cms.mapper.ArticleMapper;
import com.zhaotianyue.cms.mapper.SlideMapper;
import com.zhaotianyue.cms.service.ArticleService;
@Service
public class ArticleServiceImpl implements ArticleService {
	@Autowired
	ArticleMapper am;
	@Autowired
	SlideMapper sm;
	
	@Override
	public PageInfo<Article> listByUser(Integer id, int pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, Constant.PAGESIZE);
		return new PageInfo<Article>(am.listByUser(id));
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return am.updDeleted(id);
	}

	@Override
	public List<Channel> getChannels() {
		// TODO Auto-generated method stub
		return am.getAllChannels();
	}

	@Override
	public List<Category> getCategorisByCid(int cid) {
		// TODO Auto-generated method stub
		return am.getCategorisByCid(cid);
	}

	@Override
	public int add(Article article) {
		// TODO Auto-generated method stub
		return am.add(article);
	}

	@Override
	public Article getById(int id) {
		// TODO Auto-generated method stub
		return am.getById(id);
	}

	@Override
	public int update(Article article, Integer id) {
		Article articleSrc = this.getById(article.getId());
		if(articleSrc.getUser_id() != id) {
			// todo 如果  不是自己的文章 需要。。。。。
		}
		return am.update(article);
	}

	@Override
	public PageInfo<Article> list(int status, int page) {
		PageHelper.startPage(page, Constant.PAGESIZE);
		return new PageInfo<Article>(am.list(status));
	}

	@Override
	public Article getInfoById(int id) {
		// TODO Auto-generated method stub
		return am.getInfoById(id);
	}

	@Override
	public int setHot(int id, int status) {
		// TODO Auto-generated method stub
		return am.setHot(id,status);
	}

	@Override
	public int setCheckStatus(int id, int status) {
		// TODO Auto-generated method stub
		return am.CheckStatus(id,status);
	}
	
	@Override
	public PageInfo<Article> hotList(int page) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page,Constant.PAGESIZE);
		return new PageInfo<>(am.hostList());
	}

	@Override
	public List<Article> lastList() {
		// TODO Auto-generated method stub
		return am.lastList(Constant.PAGESIZE);
	}

	@Override
	public List<Slide> getSlides() {
		// TODO Auto-generated method stub
		return sm.list();
	}

	@Override
	public PageInfo<Article> getArticles(int channleId, int catId, int page) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page,Constant.PAGESIZE);
		
		return new PageInfo<Article>(am.getArticles(channleId, catId));
	}

	@Override
	public List<Category> getCategoriesByChannelId(int channleId) {
		// TODO Auto-generated method stub
		return am.getCategoriesByChannelId(channleId) ;
	}
	
	@Override
	public int addComment(Comment comment) {
		// TODO Auto-generated method stub
		int result =  am.addComment(comment);
		 //文章评论数目自增
		if(result>0)
			am.increaseCommentCnt(comment.getArticleId());
		
		return result;
	}

	@Override
	public PageInfo<Comment> getComments(int articleId, int page) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, Constant.PAGESIZE);
		return new PageInfo<Comment>(am.getComments(articleId));
		
		
	}

	@Override
	public PageInfo<Link> link(int page) {
		PageHelper.startPage(page, Constant.PAGESIZE);
		return new PageInfo<Link>(am.link());
	}
	
	@Override
	public int addComplian(Complain complain) {
		// TODO Auto-generated method stub
		
		//添加投诉到数据库
		int result = am.addCoplain(complain);
		// 增加投诉的数量
		if(result>0)
			am.increaseComplainCnt(complain.getArticleId());
		
		return 0;
	}
	@Override
	public PageInfo<Complain> getComplains(int articleId, int page) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, Constant.PAGESIZE);
		return new PageInfo<Complain>(am.getComplains(articleId));
	}
}
