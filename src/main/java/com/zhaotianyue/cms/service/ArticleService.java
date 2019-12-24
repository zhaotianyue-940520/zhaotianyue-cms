package com.zhaotianyue.cms.service;

import java.util.List;

import javax.validation.Valid;

import com.github.pagehelper.PageInfo;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Category;
import com.zhaotianyue.cms.entity.Channel;
import com.zhaotianyue.cms.entity.Comment;
import com.zhaotianyue.cms.entity.Complain;
import com.zhaotianyue.cms.entity.Link;
import com.zhaotianyue.cms.entity.Slide;

public interface ArticleService {

	PageInfo<Article> listByUser(Integer id, int pageNum);

	int delete(int id);

	List<Channel> getChannels();

	List<Category> getCategorisByCid(int cid);
	
	int add(Article article);

	Article getById(int id);

	int update(Article article, Integer id);

	PageInfo<Article> list(int status, int page);

	Article getInfoById(int id);

	int setHot(int id, int status);

	int setCheckStatus(int id, int status);
	/**
	 * 获取热门文章
	 * @param page
	 * @return
	 */
	PageInfo<Article> hotList(int page);

	/**
	 * 获取最新文章NAG
	 * @return
	 */
	List<Article> lastList();

	/**
	 * 获取轮播图
	 * @return
	 */
	List<Slide> getSlides();

	List<Category> getCategoriesByChannelId(int channelId);

	PageInfo<Article> getArticles(int channelId, int catId, int page);
	
	/**
	 * 发表评论
	 * @param comment
	 * @return
	 */
	int addComment(Comment comment);

	/**
	 * 根据文章id获取评论
	 * @param id
	 * @param page
	 * @return
	 */
	PageInfo<Comment> getComments(int articleId, int page);
	//查询所有友情链接
	PageInfo<Link> link(int page);

	int addComplian(@Valid Complain complain);
	
	PageInfo<Complain> getComplains(int articleId, int page);

	PageInfo<Complain> complain(int page);
}
