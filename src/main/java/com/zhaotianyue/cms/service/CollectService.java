package com.zhaotianyue.cms.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Collect;

public interface CollectService {

	void save(Collect collect);
	
	List<Collect> list();

	List<Collect> mohuFenye(int i, int j, int k);

	void del(int i);

	PageInfo<Collect> listCollect(Integer id, int pageNum);

	int delete(int id);

}
