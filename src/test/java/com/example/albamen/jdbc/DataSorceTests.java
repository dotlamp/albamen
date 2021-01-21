package com.example.albamen.jdbc;

import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

import javax.sql.DataSource;
import java.sql.Connection;

@SpringBootTest
@ContextConfiguration(classes = {com.example.albamen.config.DatabaseConfig.class})
@Log4j2
public class DataSorceTests{
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection(){
		try(Connection con = dataSource.getConnection()){
			log.info(String.valueOf(con));
			System.out.println("con 성공");
		}catch (Exception e){
			System.err.println("con 오류"+e.getMessage());
			e.printStackTrace();
		}
	}
	
	@Test
	public void testFactory(){
		log.info(String.valueOf(sqlSessionFactory));
	}
	
	@Test
	public void testMybatis(){
		try(SqlSession sqlSession = sqlSessionFactory.openSession();
		    Connection con = sqlSession.getConnection();
		){
		    log.info(String.valueOf(con));
			log.info(String.valueOf(sqlSession));
			log.info(String.valueOf(con));
			System.out.println("Mybatis 성공");
		}catch (Exception e){
			System.err.println("Mybatis 오류"+e.getMessage());
			e.printStackTrace();
		}
	}
	
}
