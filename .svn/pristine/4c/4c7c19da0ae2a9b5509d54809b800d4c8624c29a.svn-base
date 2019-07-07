package com.shsxt.newbosses.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shsxt.newbosses.po.LocalBar;
import com.shsxt.newbosses.util.DBUtil;

public class LocalBarDao {

	public ArrayList<LocalBar> query() {
		ArrayList<LocalBar> localBarArr = new ArrayList<LocalBar>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.getConnection();
			String sql = "select l.localName,count(s.schLocal) from new_school s inner JOIN new_local l on l.schLocal=s.schLocal GROUP BY s.schLocal";

			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			// 将test表中的数据存储到线性表中

			while (resultSet.next()) {
				LocalBar bar = new LocalBar();
				bar.setLocalName(resultSet.getString("localName"));
				bar.setCount(resultSet.getInt("count(s.schLocal)"));
				
				localBarArr.add(bar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet, preparedStatement, connection);
		}

		return localBarArr;
		//select t.typeName,count(n.typeId) from new_note n inner JOIN new_type t on t.typeId=n.typeId GROUP BY t.typeId
		
		
	}

}
