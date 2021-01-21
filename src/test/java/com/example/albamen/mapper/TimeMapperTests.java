package com.example.albamen.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = com.example.albamen.config.DatabaseConfig.class)
@Log4j2
public class TimeMapperTests{
	
	private TimeMapper timeMapper;

	@Autowired
	public void setTimeMapper(TimeMapper timeMapper){
		this.timeMapper = timeMapper;
	}
	
	@Test
	public void testGetTime(){
		log.info(timeMapper.getTime());
	}
	
	@Test
	public void testGetTime2(){
//		timeMapper.getTime2();
		log.info(timeMapper.getTime2());
	}
	
}
