package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// SingleTon 선언
public class DBconn {
	private static Connection connection = null;
	
	private DBconn() {}
	
	public static Connection getConnection(){
		
		if (connection == null) {
			// JDBC Driver ojdbc6.jar 필요
			String className = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "SCOTT";
			String password = "tiger";
			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // if
		
		return connection;
		
	} // getConnection
	
	// 오버로딩
	public static Connection getConnection(String url, String user, String password){
		
		if (connection == null) {
			String className = "oracle.jdbc.driver.OracleDriver";

			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // if
		
		return connection;
		
	} // getConnection
	
	public static void close() {
		try {
			// connection 객체가 null이 아니고 닫혀있지 않는다면 객체를 닫겠다.
			if (connection != null && !connection.isClosed()) { 
				connection.close();
			} // if
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//***** [암기] *****
		connection = null;
		
	} // close
	
} // class
