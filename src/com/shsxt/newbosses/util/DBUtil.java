package com.shsxt.newbosses.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

/**
 * 数据库工具类
 * 	1、得到数据库连接
 * 	2、关闭资源
 * @author Lisa Li
 *
 */
public class DBUtil {

	
	/**
	 * 得到数据库连接
	 * 	1、加载配置文件，得到输入流
	 * 	2、得到Properties对象
	 * 	3、调用Properties对象的load()方法，加载配置文件的输入流
	 * 	4、通过Properties对象的getProperty()的方法，得到对应的配置项
	 * 	5、加载驱动
	 * 	6、得到数据库连接
	 * @return
	 */
	public static Connection getConnection() {
		
		Connection connection = null;
		
		try {
			// 1、加载配置文件，得到输入流
			InputStream in = DBUtil.class.getClassLoader().getResourceAsStream("db.properties");
			// 2、得到Properties对象
			Properties properties = new Properties();
			// 3、调用Properties对象的load()方法，加载配置文件的输入流
			properties.load(in);
			// 4、通过Properties对象的getProperty()的方法，得到对应的配置项
			String jdbcName = properties.getProperty("jdbcName");
			String dbUrl = properties.getProperty("dbUrl");
			String dbName = properties.getProperty("dbName");
			String dbPwd = properties.getProperty("dbPwd");
			// 5、加载驱动
			Class.forName(jdbcName);
			// 6、得到数据库连接
			connection = DriverManager.getConnection(dbUrl, dbName, dbPwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	/**
	 * 关闭资源
	 * @param resultSet
	 * @param preparedStatement
	 * @param connection
	 */
	public static void close(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection) {
		try {
			
			// 判断资源对象是否为空，不为空则关闭
			if (resultSet != null) {
				resultSet.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
	
}
