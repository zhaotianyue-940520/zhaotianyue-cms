package com.zhaotianyue.cms.service;

import java.util.List;

import com.zhaotianyue.cms.entity.Link;

public interface LinkService {

	int addLink(Link l);

	Link toUpd(Link l);

	int updLink(Link l);

	int delLink(Link l);

	List<Link> link();

}
