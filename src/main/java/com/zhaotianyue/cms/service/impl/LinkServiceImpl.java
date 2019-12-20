package com.zhaotianyue.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhaotianyue.cms.entity.Link;
import com.zhaotianyue.cms.mapper.LinkMapper;
import com.zhaotianyue.cms.service.LinkService;
@Service
public class LinkServiceImpl implements LinkService {
	@Autowired
	LinkMapper lm;

	@Override
	public int addLink(Link l) {
		// TODO Auto-generated method stub
		return lm.addLink(l);
	}

	@Override
	public Link toUpd(Link l) {
		// TODO Auto-generated method stub
		return lm.toUpd(l);
	}

	@Override
	public int updLink(Link l) {
		// TODO Auto-generated method stub
		return lm.updLink(l);
	}

	@Override
	public int delLink(Link l) {
		// TODO Auto-generated method stub
		return lm.delLink(l);
	}

	@Override
	public List<Link> link() {
		// TODO Auto-generated method stub
		return lm.link();
	}
}
