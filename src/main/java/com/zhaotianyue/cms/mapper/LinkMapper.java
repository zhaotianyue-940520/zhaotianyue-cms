package com.zhaotianyue.cms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.zhaotianyue.cms.entity.Link;

public interface LinkMapper {
	@Insert (" insert cms_link set name=#{name},url=#{url},created=now() ")
	int addLink(Link l);
	@Select(" select * from cms_link where  id = #{id}")
	Link toUpd(Link l);
	@Update(" update cms_link set name=#{name},url=#{url},created=now() where id = #{id} ")
	int updLink(Link l);
	@Delete(" delete from cms_link where id = #{id} ")
	int delLink(Link l);
	@Select(" select * from cms_link ")
	List<Link> link();

}
