package com.shsxt.newbosses.dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import com.shsxt.newbosses.util.DBUtil;

/**
 * 基础的数据库操作类
 * 	1、更新操作
 * 		添加、修改、删除
 * 	2、查询某个字段（只查一条记录，一个字段；常用场景：查询总数量）
 * 	3、查询对象集合 
 * 	4、查询对象
 * @author Lisa Li
 *
 */
public class BaseDao {
	
	
	/**
	 * 更新操作
	 * 	1、得到数据库连接
	 * 	2、预编译
	 * 	3、判断参数集合是否为空
	 * 	4、参数不为空，设置循环设置参数，下标从1开始
	 * 	5、执行更新，返回受影响的行数
	 * 	
	 * @param sql
	 * @param params
	 * @return
	 */
	public int executeUpdate(String sql, List<Object> params) {
		int row = 0; // 受影响的行数
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			
			// 	1、得到数据库连接
			connection = DBUtil.getConnection();
			// 	2、预编译
			preparedStatement = connection.prepareStatement(sql);
			// 	3、判断参数集合是否为空
			if (params != null && params.size() >0) {
					//	4、参数不为空，设置循环设置参数，下标从1开始
				for(int i =0; i < params.size(); i++) {
					preparedStatement.setObject(i+1, params.get(i));
				}
			}
		    // 5、执行更新，返回受影响的行数
			row = preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.close(null, preparedStatement, connection);
		}
		return row;
	}

	
	/**
	 * 查询某个字段（只查一条记录，一个字段；常用场景：查询总数量）
	 * 	1、获取数据库连接
	 * 	2、预编译
	 *	3、判断参数集合是否为空
	 * 	4、参数不为空，设置循环设置参数，下标从1开始
	 * 	5、执行查询，返回结果集
	 * 	6、判断并分析结果集，得到查询到的第一个字段
	 * 	7、关闭资源
	 * @param sql
	 * @param params
	 * @return
	 */
	public Object findSingleValue(String sql, List<Object> params) {
		Object object = null; // 返回的字段
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			
			// 1、获取数据库连接
			connection = DBUtil.getConnection();
			// 2、预编译
			preparedStatement = connection.prepareStatement(sql);
			// 3、判断参数集合是否为空
			if (params != null && params.size() >0) {
					//	4、参数不为空，设置循环设置参数，下标从1开始
				for(int i =0; i < params.size(); i++) {
					preparedStatement.setObject(i+1, params.get(i));
				}
			}
			// 	5、执行查询，返回结果集
			resultSet = preparedStatement.executeQuery();
			// 	6、判断并分析结果集，得到查询到的第一个字段
			if (resultSet.next()) {
				object = resultSet.getObject(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.close(resultSet, preparedStatement, connection);
		}
		
		return object;
	}
	
	
	/**
	 * 查询对象集合
	 * 	1、获取数据库连接
	 * 	2、预编译
	 *	3、判断参数集合是否为空
	 * 	4、参数不为空，设置循环设置参数，下标从1开始
	 * 	5、执行查询，返回resultSe结果集
	 * 	6、得到resultSet结果集的元数据对象 （得到当前sql语句查询到的字段以及查询字段的数量）
	 * 	7、得到查询字段的数量（循环给对象的字段赋值）
	 * 	8、判断并分析结果集
	 * 		1、实例化对象
	 * 		2、循环字段的数量，得到每次查询到的字段名
	 * 		3、字段名通过反射获取到实例化的对象中对应的Field对象 （field字段的类型）
	 * 		4、通过字段名首字母大写，拼接得到方法名字符串
	 * 		5、方法名字符串通过反射获取到实例化的对象中对应的set方法，并设置方法中参数的类型
	 * 		6、通过invoke方法，调用当前set方法，并赋值
	 * 		7、将对象设置到list集合中
	 * 	9、关闭资源
	 *	
	 * @param sql
	 * @param params
	 * @param cls
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List queryRows(String sql, List<Object> params, Class cls) {
		List list = new ArrayList();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			
			// 1、获取数据库连接
			connection = DBUtil.getConnection();
			// 2、预编译
			preparedStatement = connection.prepareStatement(sql);
			// 3、判断参数集合是否为空
			if (params != null && params.size() >0) {
					//	4、参数不为空，设置循环设置参数，下标从1开始
				for(int i =0; i < params.size(); i++) {
					preparedStatement.setObject(i+1, params.get(i));
				}
			}
			// 5、执行查询，返回结果集
			resultSet = preparedStatement.executeQuery();
			// 6、得到resultSet结果集的元数据对象 （得到当前sql语句查询到的字段以及查询字段的数量）
			ResultSetMetaData metaData = resultSet.getMetaData();
			// 7、得到查询字段的数量（循环给对象的字段赋值）
			int fieldNum = metaData.getColumnCount();
			// 8、判断并分析结果集
			while(resultSet.next()) {
				// 1、实例化对象
				Object object = cls.newInstance();
				// 2、循环字段的数量，
				for (int i = 1; i <= fieldNum; i++) {
					// 得到每次查询到的字段名    getColumnLabel:获取指定下标的字段名（有别名则获取别名 ）   getColumnName：获取指定下标的字段名
					String columnName = metaData.getColumnLabel(i);
					// 3、字段名通过反射获取到实例化的对象中对应的Field对象 （field字段的类型）
					Field field = cls.getDeclaredField(columnName);
					// 4、通过字段名首字母大写，拼接得到方法名字符串
					String methodName = "set" + columnName.substring(0,1).toUpperCase() + columnName.substring(1);
					// 5、方法名字符串通过反射获取到实例化的对象中对应的set方法，并设置方法中参数的类型
					Method method = cls.getDeclaredMethod(methodName, field.getType());
					// 6、通过invoke方法，调用当前set方法，并赋值
					method.invoke(object, resultSet.getObject(columnName));
				}
				// 7、将对象设置到list集合中
				list.add(object);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.close(resultSet, preparedStatement, connection);
		}
		return list;
	}
	
	
	
	/**
	 * 查询对象
	 * 	从集合中获取一个对象即可
	 * @param sql
	 * @param params
	 * @param cls
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Object queryRow(String sql, List<Object> params, Class cls) {
		Object object = null;
		// 调用查询对象集合的方法
		List list = queryRows(sql, params, cls);
		// 判断对象集合是否为空，不为空，得到第一个对象
		if (list != null && list.size() > 0) {
			object = list.get(0);
		}
		return object;
	}
	
	
	
	
	
}
