package com.example.albamen.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface TimeMapper {
	
	@Select("select SYSDATE() from dual")
	public String getTime();
	
	public String getTime2();
}
