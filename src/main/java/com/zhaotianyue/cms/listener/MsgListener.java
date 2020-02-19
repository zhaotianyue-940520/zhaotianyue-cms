package com.zhaotianyue.cms.listener;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.kafka.listener.MessageListener;

import com.alibaba.fastjson.JSON;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.service.ArticleService;

public class MsgListener implements MessageListener<String, String>{
	@Autowired
	ArticleService articleService;
	@Autowired
	ElasticsearchTemplate et; 
	@Override
	public void onMessage(ConsumerRecord<String,String> data) {
		String value = data.value();
		int indexOf = value.indexOf("add");
		if(indexOf>0) {
			
			String replace = value.replace("add", "");
			
			articleService.liulan(replace);
			
		}
		
		Article article = JSON.parseObject(value, Article.class);
		articleService.add(article);
		
	}

}
