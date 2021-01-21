package com.example.albamen.jdbc;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;


@Log4j2
public class JDBCTests{
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String db = "albamen";
	private static final String id = "albamen";
	private static final String password = "albamen";
	
	@Test
	public void testConnection() throws ClassNotFoundException{
		Class.forName(driver);
		try{
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?serverTimezone=UTC&characterEncoding=UTF-8", id, password);
			log.info(String.valueOf(con));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
