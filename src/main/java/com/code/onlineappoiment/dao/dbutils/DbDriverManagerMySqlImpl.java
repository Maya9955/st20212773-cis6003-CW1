package com.code.onlineappoiment.dao.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbDriverManagerMySqlImpl implements DbDriverManager {

	public Connection getConnection() throws ClassNotFoundException, SQLException {	

		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://127.0.0.1:3306/st20212773-cis6003";
		String userName = "root";
		String password = "";
		
		return DriverManager.getConnection(url, userName, password);
	}

}
