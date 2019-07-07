package com.shsxt.newbosses.service;

import java.util.List;

import com.shsxt.newbosses.dao.TypeDao;
import com.shsxt.newbosses.po.New_Type;
import com.shsxt.newbosses.po.vo.LocalList;

public class TypeService {
	
	private TypeDao typeDao = new TypeDao();

	/**
	 * 查询类型列表
	 * @param userId
	 * @return
	 */
	public List<New_Type> findTypeList() {
		// 调用Dao层的查询方法，返回集合
		List<New_Type> list = typeDao.findTypeList();
		return list;
	}

	/**
	 * 查询限定schId的 类型列表
	 * @param schId
	 * @return
	 */
	public List<New_Type> findTypeList(String schId) {
		// 调用Dao层的查询方法，返回集合
		List<New_Type> list = typeDao.findTypeList(schId);
		return list;
	}

	/**
	 * 获取论坛页面动态信息
	 * @return
	 */
	public List<LocalList> findBbsMsg() {
		// 调用Dao层方法,获取列表对象
		List<LocalList> bbsList = typeDao.findBbsMsg();
		
		return bbsList;
	}

}
