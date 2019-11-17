package com.fsoft.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtils {
	private static String DRIVER, SERVER_NAME, DB_NAME, USER_NAME, PASSWORD;
	static final String FILE_NAME = "properties\\DBConfig.properties";

	public static Connection getConnect() throws IOException,
			ClassNotFoundException, SQLException {
		Properties properties = new Properties();
		InputStream fStream = DBUtils.class.getResourceAsStream("/DBConfig.properties");

		properties.load(fStream);

		DRIVER = properties.getProperty("driver");
		SERVER_NAME = properties.getProperty("server");
		DB_NAME = properties.getProperty("dbname");
		USER_NAME = properties.getProperty("username");
		PASSWORD = properties.getProperty("password");

		/*System.out.println(DRIVER+"\t"+SERVER_NAME+"\t"+USER_NAME);*/
		/*
		 * Load driver
		 */
		Class.forName(DRIVER);

		/*
		 * Open connect
		 */
		return DriverManager.getConnection(SERVER_NAME + ";databaseName="
				+ DB_NAME, USER_NAME, PASSWORD);
	}

	public static void main(String[] args) {
		try {
			Connection connection = DBUtils.getConnect();
			if (connection != null)
				System.out.println("success!");
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}
}
