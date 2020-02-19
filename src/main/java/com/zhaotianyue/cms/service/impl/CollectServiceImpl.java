package com.zhaotianyue.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhaotianyue.cms.condition.Constant;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Collect;
import com.zhaotianyue.cms.mapper.CollectMapper;
import com.zhaotianyue.cms.service.CollectService;
@Service
public class CollectServiceImpl implements CollectService {
	@Autowired
	CollectMapper collectMapper;

	@Override
	public void save(Collect collect) {
		// TODO Auto-generated method stub
		collectMapper.save(collect);
	}

	@Override
	public List<Collect> list() {
		// TODO Auto-generated method stub
		return collectMapper.list();
	}

	@Override
	public List<Collect> mohuFenye(int i, int j, int k) {
		// TODO Auto-generated method stub
		return collectMapper.mohuFenye(i,j,k);
	}

	@Override
	public void del(int i) {
		// TODO Auto-generated method stub
		collectMapper.del(i);
	}

	@Override
	public PageInfo<Collect> listCollect(Integer id, int pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, Constant.PAGESIZE);
		return new PageInfo<Collect>(collectMapper.listCollect(id));
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return collectMapper.delete(id);
	}
}
