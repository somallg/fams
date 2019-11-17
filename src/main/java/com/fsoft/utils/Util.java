package com.fsoft.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Util {
	/*
	 * This method connect to DB.
	 * 
	 * @Return: Connection object.
	 */
	public static Connection connect(String DRIVER, String CONNECTTION_URL,
			String USER_NAME, String PASSWORD) throws ClassNotFoundException,
			SQLException {
		// Load driver
		Class.forName(DRIVER);

		// Get connection
		Connection connection = DriverManager.getConnection(CONNECTTION_URL,
				USER_NAME, PASSWORD);

		return connection;
	}
}
