package com.zhaotianyue.demoEs;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.mapper.ArticleEs;
import com.zhaotianyue.cms.service.ArticleService;

@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class DemoEs {
	@Autowired
	ArticleEs ae;
	@Autowired
	ArticleService as;
	
	@Test
	public void save() {
		List<Article> list =as.listAll();
		for (Article article : list) {
			System.out.println(article);
		}
		ae.saveAll(list);
	}
}
