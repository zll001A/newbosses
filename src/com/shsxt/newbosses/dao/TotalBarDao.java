package com.shsxt.newbosses.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shsxt.newbosses.po.Bar;
import com.shsxt.newbosses.po.TotalBar;
import com.shsxt.newbosses.util.DBUtil;

public class TotalBarDao {

	public ArrayList<TotalBar> query() {
		ArrayList<TotalBar> totalArr = new ArrayList<TotalBar>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.getConnection();
			String sql = "select DATE_FORMAT(pubTime,'%Y年%m月%d日') pubTime,count(1) noteCount from new_note GROUP BY DATE_FORMAT(pubTime,'%Y年%m月%d日') order by pubTime asc";

			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			// 将test表中的数据存储到线性表中

			while (resultSet.next()) {
				TotalBar totalBar = new TotalBar();
				totalBar.setPubTime(resultSet.getString("pubTime"));
				totalBar.setCount(resultSet.getInt("noteCount"));
				
				totalArr.add(totalBar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet, preparedStatement, connection);
		}

		return totalArr;
	}

}
