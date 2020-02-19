package com.zhaotianyue.cms.controller;

import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Category;
import com.zhaotianyue.cms.entity.Channel;
import com.zhaotianyue.cms.entity.Link;
import com.zhaotianyue.cms.entity.Slide;
import com.zhaotianyue.cms.mapper.ArticleEs;
import com.zhaotianyue.cms.service.ArticleService;
import com.zhaotianyue.cms.service.LinkService;
import com.zhaotianyue.cms.utils.HLUtils;

@Controller
public class IndexController {
	@Autowired
	ArticleService as;
	@Autowired
	ElasticsearchTemplate elasticsearchTemplate;
	@Autowired
	LinkService ls;
	@Autowired
	ArticleEs ae;
	@Autowired
	RedisTemplate rt;
	
	@GetMapping("index")
	public String search(String key, Model model, HttpServletRequest request,
			@RequestParam(defaultValue = "1") int page) {
		Thread t1 = new Thread() {
			public void run() {
				// 获取所有的栏目
				List<Channel> channels = as.getChannels();
				request.setAttribute("channels", channels);
			};
		};
		t1.start();
		Thread  t2 =  new Thread() {
			public void run() {
		// 获取热门文章
				List<Article> redisArticles = rt.opsForList().range("hot_articles", 0, -1);
				if (redisArticles == null || redisArticles.size() == 0) {
					List<Article> lastArticles = as.hotList();
					rt.opsForList().leftPushAll("hot_articles", lastArticles.toArray());
					rt.expire("hot_articles", 5, TimeUnit.MINUTES);
					// 并且返回给前台
					request.setAttribute("articlePage", lastArticles);
				} else {
					// 5.如果不为空,直接返回给前台
					request.setAttribute("articlePage", redisArticles);
				}
				
				
				
				
				
//			PageInfo<Article> articlePage= as.hotList(page);
//			
//			request.setAttribute("articlePage", articlePage);
				
			};
		};
		t2.start();
		Thread t3 = new Thread() {
			@SuppressWarnings("unchecked")
			public void run() {

				List<Article> redisArticles = rt.opsForList().range("new_articles", 0, -1);
				if (redisArticles == null || redisArticles.size() == 0) {
					List<Article> lastArticles = as.lastList();
					rt.opsForList().leftPushAll("new_articles", lastArticles.toArray());
					rt.expire("new_articles", 5, TimeUnit.MINUTES);
					// 并且返回给前台
					request.setAttribute("lastArticles", lastArticles);
				} else {
					// 5.如果不为空,直接返回给前台
					request.setAttribute("lastArticles", redisArticles);
				}
			};
		};
		t3.start();
		long currentTimeMillis = System.currentTimeMillis();
		PageInfo<Article> pageInfo = (PageInfo<Article>) HLUtils.findByHighLight(elasticsearchTemplate, Article.class,page, 2, new String[] { "title" }, "id", key);
		List<Article> list = pageInfo.getList();
		long currentTimeMillis2 = System.currentTimeMillis();
		System.out.println("消耗时长"+(currentTimeMillis2-currentTimeMillis)+"毫秒");
		model.addAttribute("articlePage", list);
		model.addAttribute("key", key);
		return "index";
	}
	
	@RequestMapping(value = {"index","/"})
	public String index(HttpServletRequest request,@RequestParam(defaultValue = "1") int page) throws InterruptedException {
		Thread  t1 =  new Thread() {
			public void run() {
		// 获取所有的栏目
		List<Channel> channels = as.getChannels();
		request.setAttribute("channels", channels);
			};
		};
		
		Thread  t2 =  new Thread() {
			public void run() {
		// 获取热门文章
				List<Article> redisArticles = rt.opsForList().range("hot_articles", 0, -1);
				if (redisArticles == null || redisArticles.size() == 0) {
					List<Article> lastArticles = as.hotList();
					rt.opsForList().leftPushAll("hot_articles", lastArticles.toArray());
					rt.expire("hot_articles", 5, TimeUnit.MINUTES);
					// 并且返回给前台
					request.setAttribute("articlePage", lastArticles);
				} else {
					// 5.如果不为空,直接返回给前台
					request.setAttribute("articlePage", redisArticles);
				}
				
				
				
				
				
//			PageInfo<Article> articlePage= as.hotList(page);
//			
//			request.setAttribute("articlePage", articlePage);
				
			};
		};
		
		Thread  t3 =  new Thread() {
			@SuppressWarnings("unchecked")
			public void run() {
				List<Article> newarticle = rt.opsForList().range("newarticle", 0, -1);
				
				if(newarticle==null||newarticle.size()==0) {
					// 获取最新文章
					List<Article> lastArticles = as.lastList();
					rt.opsForList().leftPushAll("newarticle", lastArticles.toArray());
					request.setAttribute("lastArticles", lastArticles);
				}else {
					
					request.setAttribute("lastArticles", newarticle);
				}
			};
		};
		
		Thread  t4 =  new Thread() {
			public void run() {
		// 轮播图
		List<Slide> slides = as.getSlides();
		request.setAttribute("slides", slides);
		
			};
		};
		Thread  t5 =  new Thread() {
			public void run() {
				// 友情链接
				List<Link> articlePage = ls.link();
				request.getSession().setAttribute("link", articlePage);
				
			};
		};
		
		
		t1.start();
		t2.start();
		t3.start();
		t4.start();
		t5.start();
		
		t1.join();
		t2.join();
		t3.join();
		t4.join();
		t5.join();
		
		return "index";
	}
	
	/**
	 * 
	 * @param request  请求
	 * @param channleId  栏目的id
	 * @param catId 分类的id
	 * @param page 页码
	 * @return
	 * @throws InterruptedException 
	 */
	@RequestMapping("channel")
	public String channel(HttpServletRequest request,
			int channelId,
			@RequestParam(defaultValue="0") int catId,
			@RequestParam(defaultValue="1")  int page) throws InterruptedException {
		
		Thread  t1 =  new Thread() {
			public void run() {
		// 获取所有的栏目
		List<Channel> channels = as.getChannels();
		request.setAttribute("channels", channels);
			};
		};
		
		Thread  t2 =  new Thread() {
			public void run() {
		// 当前栏目下  当前分类下的文章
		PageInfo<Article> articlePage= as.getArticles(channelId,catId, page);
		request.setAttribute("articlePage", articlePage);
			};
		};
		
		Thread  t3 =  new Thread() {
			public void run() {
		// 获取最新文章
		List<Article> lastArticles = as.lastList();
		request.setAttribute("lastArticles", lastArticles);
			};
		};
		
		Thread  t4 =  new Thread() {
			public void run() {
		// 轮播图
		List<Slide> slides = as.getSlides();
		request.setAttribute("slides", slides);
		
			};
		};
		
		// 获取当前栏目下的所有的分类 catId
		Thread  t5 =  new Thread() {
			public void run() {
		// 
		List<Category> categoris= as.getCategoriesByChannelId(channelId);
		request.setAttribute("categoris", categoris);
		System.err.println("categoris is " + categoris);
			};
		};
		
		Thread  t6 =  new Thread() {
			public void run() {
				// 友情链接
				List<Link> articlePage = ls.link();
				request.getSession().setAttribute("link", articlePage);
			};
		};
		
		t1.start();
		t2.start();
		t3.start();
		t4.start();
		t5.start();
		t6.start();
		
		t1.join();
		t2.join();
		t3.join();
		t4.join();
		t5.join();
		t6.join();
		
		// 参数回传
		request.setAttribute("catId", catId);
		request.setAttribute("channelId", channelId);
		
		return "channel";
	}
}
