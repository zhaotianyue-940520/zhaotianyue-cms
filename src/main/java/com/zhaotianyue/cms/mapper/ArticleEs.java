package com.zhaotianyue.cms.mapper;

import java.util.List;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import com.zhaotianyue.cms.entity.Article;

public interface ArticleEs extends ElasticsearchRepository<Article, Integer>{

	List<Article> findByTitle(String key);
	//根据标题查询
}
