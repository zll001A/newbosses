package com.shsxt.newbosses.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.shsxt.newbosses.po.New_School;
import com.shsxt.newbosses.po.New_User;
import com.shsxt.newbosses.util.DBUtil;
import com.shsxt.newbosses.po.Note;
import com.shsxt.newbosses.po.NoteType;



public class UserDao {
	
	//记入日志
	private static Logger logger = LoggerFactory.getLogger(UserDao.class);
	private static BaseDao baseDao = new BaseDao();
	/**
	 * 通过用户名查询用户对象
		1、得到数据库连接
		2、定义sql语句  String sql = "select * from tb_user where uname = ?";
		3、预编译
		4、设置参数，下标从1开始
		5、执行查询，返回resultSet结果集
		6、判断并分析结果集，得到用户对象
		7、关闭资源
	 * @param uname
	 * @return
	 */
	public New_User findUserByName(String uname) {
		New_User user = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			// 1、得到数据库连接
			connection = DBUtil.getConnection();
			// 2、定义sql语句
			String sql = "select *  , b.schName, (select  count(*)  from new_note c  where c.userId=a.userId ) as noteCount  from  new_user a LEFT JOIN new_school  b  on a.schId=b.schId  where uname = ?";
			/*logger.info("sql语句：" + sql);
			logger.debug("sql语句：{}",sql);*/
			// 3、预编译
			preparedStatement = connection.prepareStatement(sql);
			// 4、设置参数，下标从1开始
			preparedStatement.setString(1, uname);
			// 5、执行查询，返回resultSet结果集
			resultSet = preparedStatement.executeQuery();
			// 6、判断并分析结果集，得到用户对象
			if (resultSet.next()) {
				user = new New_User();
				user.setHead(resultSet.getString("head"));
				user.setMood(resultSet.getString("mood"));
				user.setNick(resultSet.getString("nick"));
				user.setuName(uname);
				user.setuPwd(resultSet.getString("uPwd"));
				user.setUserId(resultSet.getInt("userId"));
				user.setSchId(resultSet.getString("schId"));
				user.setSchName(resultSet.getString("schName"));
				user.setNoteCount(resultSet.getInt("noteCount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 7、关闭资源
			DBUtil.close(resultSet, preparedStatement, connection);
		}
		return user;
	}
	
	/**
	 * 验证昵称的唯一性
	 * @param nick
	 * @param userId
	 * @return
	 */
	public New_User findUserByNickAndUserId(String nick, Integer userId) {
		// 1.定义sql语句
		String sql = "select * from new_user where nick = ? & userId != ?";
		// 2.设置参数集合
		List<Object> params = new ArrayList<Object>();
		params.add(nick);
		params.add(userId);
		// 3.调用BaseDao的查询方法，返回用户对象
		New_User user = (New_User) baseDao.queryRow(sql, params, New_User.class);
		return user;
	}

	
	
	
	
	/**
	 * 通过用户ID修改用户信息，返回受影响的行数
		1、定义sql语句   String sql = "update tb_user set nick = ?, mood= ?, head = ? where userId = ?";
		2、设置参数集合
		3、调用BaseDao的更新方法，返回受影响的行数
	 * @param userId
	 * @param nick
	 * @param mood
	 * @param head
	 * @return
	 */
	public int updateUser(Integer userId, String nick, String mood, String head) {
		// 1、定义sql语句  
		String sql = "update new_user set nick = ?, mood= ?, head = ? where userId = ?";
		// 2、设置参数集合
		List<Object> params = new ArrayList<Object>();
		params.add(nick);
		params.add(mood);
		params.add(head);
		params.add(userId);
		// 3、调用BaseDao的更新方法，返回受影响的行数
		int row  = baseDao.executeUpdate(sql, params);
		return row;
	}
	
	
}
