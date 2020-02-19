package com.zhaotianyue.cms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Collect;

public interface CollectMapper {
	@Insert("insert cms_collect set userId=#{userId},url=#{url},name=#{name},created=now() ")
	void save(Collect collect);
	@Select("select * from cms_collect ORDER BY created DESC")
	List<Collect> list();
	@Select("select * from cms_collect where userId=${i} ORDER BY created DESC limit ${j},${k}")
	List<Collect> mohuFenye(@Param("i")int i, @Param("j")int j, @Param("k")int k);
	@Delete(" delete from cms_collect where id =#{i}")
	void del(@Param("i")int i);
	@Select("select * from cms_collect where userId=${i} ORDER BY created DESC")
	List<Collect> listCollect(@Param("i")Integer id);
	@Delete(" delete from cms_collect where id =#{id}")
	int delete(@Param("id")int id);

}
