package com.shsxt.newbosses.dao;

import java.util.ArrayList;
import java.util.List;

import com.shsxt.newbosses.po.New_Type;
import com.shsxt.newbosses.po.vo.LocalList;

public class TypeDao {
	
	private BaseDao baseDao = new BaseDao();

	/**
	 * 查询类型列表 无schId限定条件
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<New_Type> findTypeList() {
		// 定义sql语句
		String sql = "select typeId,typeName,schName from new_type t ,new_school s where t.schId = s.schId";
		// 设置参数集合
		List<Object> params = new ArrayList<Object>();
		// 调用BaseDao层的查询方法，返回集合
		List<New_Type> list = baseDao.queryRows(sql, params, New_Type.class);
		return list;
	}

	/**
	 * 通过用户ID查询类型列表 有schId限定条件
	 * @param schId
	 * @return
	 */
	public List<New_Type> findTypeList(String schId) {
		// 定义sql语句
		String sql = "select typeId,typeName,schName from new_type t ,new_school s where t.schId = s.schId and t.schId = ?";
		// 设置参数集合
		List<Object> params = new ArrayList<Object>();
		params.add(schId);
		// 调用BaseDao层的查询方法，返回集合
		@SuppressWarnings("unchecked")
		List<New_Type> list = baseDao.queryRows(sql, params, New_Type.class);
		return list;
	}

	/**
	 * 获取论坛页面动态信息
	 * @return
	 */
	public List<LocalList> findBbsMsg() {
		//创建List对象
		List<LocalList> listBbsMsg = new ArrayList<>();
		for(int i = 0 ;i<=8;i++){  //从高中不算地区到其他所有大学所在地
			//定义sql语句
			String sql ="select COUNT(1) noteCount,MAX(pubTime) lastPubTime,schLocal from "+
			"(select title,content,typeName,userId,pubTime from new_note n,new_type t where t.typeId=n.typeId) m left outer join"
			+"(select uName,schName,schLocal,u.userId from new_user u,new_school s where u.schId = s.schId) u "
			+"on m.userId = u.userId GROUP BY schLocal  HAVING schLocal = "+i;
			// 设置参数集合
			List<Object> params = new ArrayList<Object>();
			//调用BaseDao层的查询方法，返回对象
			LocalList msg = (LocalList) baseDao.queryRow(sql, params, LocalList.class);
			listBbsMsg.add(msg);
		}
		
		return listBbsMsg;
	}

}
