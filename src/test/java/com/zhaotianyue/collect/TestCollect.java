package com.zhaotianyue.collect;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhaotianyue.cms.entity.Collect;
import com.zhaotianyue.cms.service.CollectService;
import com.zhaotianyue.cms.utils.StringUtils;

@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestCollect {
	@Autowired
	CollectService collectService;
	
	@Test
	public void save() {
		Collect collect = new Collect();
		boolean httpUrl = StringUtils.isHttpUrl("http://localhost:8083/article/showdetail?id=106");
		
		if(httpUrl) {
			collect.setName("测试收藏2");
			collect.setUrl("http://localhost:8083/article/showdetail?id=106");
			collect.setUserId("1");
			collectService.save(collect);
		}
	}
	@Test
	public void mohuFenye() {
		List<Collect> c =collectService.mohuFenye(1,0,3);
		for (Collect collect : c) {
			System.out.println(collect);
		}
	}
	@Test
	public void del() {
		collectService.del(4);
	}
}
