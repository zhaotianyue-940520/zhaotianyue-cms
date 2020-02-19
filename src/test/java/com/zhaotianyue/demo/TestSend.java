package com.zhaotianyue.demo;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.utils.FileUtillo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:producer.xml")
public class TestSend {
	@Autowired
	KafkaTemplate<String, String> kt;
	@Test
	public void testSend() throws IOException {
		File file = new File("D:\\Article");
		File[] listFiles = file.listFiles();
		for (File file2 : listFiles) {
			String title = file2.getName().replace(".txt", "");
			String content = FileUtillo.readFile(file2, "utf8");
			System.out.println(content);
			Article article = new Article();
			article.setTitle(title);
			article.setContent(content);
			article.setPicture("D:\\pic");
			article.setUser_id(1);
			article.setChannel_id(2);
			article.setCategory_id(24);
			article.setArticleType(0);
			String jsonString = JSON.toJSONString(article);
			
			kt.send("articles", jsonString);
		}
		
		
		
	}
}
