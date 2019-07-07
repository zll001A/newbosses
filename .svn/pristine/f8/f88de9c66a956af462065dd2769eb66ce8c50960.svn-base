package com.shsxt.newbosses.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shsxt.newbosses.po.Bar;
import com.shsxt.newbosses.util.DBUtil;

public class BarDao {

	public ArrayList<Bar> query() {
		ArrayList<Bar> barArr = new ArrayList<Bar>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.getConnection();
			String sql = "select t.typeName,count(n.typeId) from new_note n inner JOIN new_type t on t.typeId=n.typeId GROUP BY t.typeId";

			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			// 将test表中的数据存储到线性表中

			while (resultSet.next()) {
				Bar bar = new Bar();
				bar.setTypeName(resultSet.getString("typeName"));
				bar.setCount(resultSet.getInt("count(n.typeId)"));
				
				barArr.add(bar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet, preparedStatement, connection);
		}

		return barArr;
		//select t.typeName,count(n.typeId) from new_note n inner JOIN new_type t on t.typeId=n.typeId GROUP BY t.typeId
		
		
	}

}
