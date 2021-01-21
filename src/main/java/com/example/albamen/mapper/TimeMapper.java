package com.example.albamen.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;


@Repository
public interface TimeMapper {
	
	@Select("select SYSDATE() from dual")
	public String getTime();
	
	public String getTime2();
}
