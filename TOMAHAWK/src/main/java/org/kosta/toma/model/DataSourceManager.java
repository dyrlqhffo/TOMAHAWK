package org.kosta.toma.model;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class DataSourceManager {
	private static DataSourceManager instance = new DataSourceManager();
	private DataSource dataSource;
	private DataSourceManager() {
		BasicDataSource dbcp = new BasicDataSource();
		dbcp.setDriverClassName("oracle.jdbc.OracleDriver");
		dbcp.setUrl("jdbc:oracle:thin:@13.125.197.253:1521:xe");
		dbcp.setUsername("tomahawk");
		dbcp.setPassword("happy");
		this.dataSource =dbcp;
	}
	public static DataSourceManager getInstance() {
		return instance;
	}
	public DataSource getDataSource() {
		return dataSource;
	}
}