package com.example.albamen.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;


@Configuration
@MapperScan(basePackages = "com.example.albamen.mapper")
@ComponentScan(basePackages = "com.example.albamen.service")
@EnableTransactionManagement
@Log4j2
public class DatabaseConfig {
	
	String db = "albamen";
	String id = "albamen";
	String password = "albamen";
	@Primary
	@Bean(name="dataSource")
	public DataSource dataSource(){
	
//		SimpleDriverDataSource ds = new SimpleDriverDataSource();
//		ds.setDriverClass(com.mysql.cj.jdbc.Driver.class);
//		ds.setUrl("jdbc:mysql://localhost:3306/albamen?serverTimezone=UTC&characterEncoding=UTF-8");
//		ds.setUsername(id);
//		ds.setPassword(password);
		
		/* HikariConfig & Log4jdbc */
		log.info("--------------------------------------------------------------------dataSource");
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://localhost:3306/"+db+"?serverTimezone=Asia/Seoul&characterEncoding=UTF-8");
		hikariConfig.setUsername(id);
		hikariConfig.setPassword(password);
		HikariDataSource ds = new HikariDataSource(hikariConfig);
		return ds;
	}
	
	
	/* MyBatis : Auto Connection close() */
	@Primary
	@Bean(name="sqlSessionFactory")
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		log.info("--------------------------------------------------------------------sqlSessionFactory");
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource());
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath:/mapper/**/*.xml"));
		return sqlSessionFactoryBean.getObject();
	}
	
	@Primary
	@Bean(name="sqlSession")
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
		log.info("--------------------------------------------------------------------sqlSession");
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
	@Primary
	@Bean(name="txManager")
	public DataSourceTransactionManager txManager() {
		log.info("--------------------------------------------------------------------txManager");
		return new DataSourceTransactionManager(dataSource());
	}
	
}
