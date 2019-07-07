package com.shsxt.newbosses.dao;

import java.util.ArrayList;
import java.util.List;

import com.shsxt.newbosses.po.New_Type;
import com.shsxt.newbosses.po.Note;
import com.shsxt.newbosses.util.StringUtil;

public class NoteDao {
	private BaseDao baseDao = new BaseDao();

	public int addOrUpdate(String typeId, String title, String content, Integer userId, String noteId) {

		String sql = "";
		// 2、设置参数集合
		List<Object> params = new ArrayList<Object>();
		params.add(title);
		params.add(content);
		params.add(typeId);
		params.add(userId);

		// 判断noteId是否为空；为空表示添加操作，不为空表示修改操作
		if (StringUtil.isEmpty(noteId)) {
			// 添加操作
			sql = "insert into new_note (title,content,typeId,pubTime,userId) values (?,?,?,now(),?)";

		} else {
			// 修改操作
			sql = "update new_note set title = ?, content=?,typeId = ?,pubTime=now(),userId = ? where noteId = ?";
			params.add(noteId);
		}

		// 3、调用BaseDao的更新方法，返回受影响的行数
		int row = baseDao.executeUpdate(sql, params);
		return row;

	}

	/**
	 * 通过当前登录用户ID得到云记列表
	 * 
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Note> findNoteList() {
		// 定义sql语句
		String sql = "select noteId,title,pubTime from new_note";
		// 2、设置参数集合
		List<Object> params = new ArrayList<Object>();
		List<Note> list = baseDao.queryRows(sql, params, Note.class);
		return list;
	}

	/**
	 * 验证话题类型唯一性
	 * 
	 * @param typeId
	 * @param typeName
	 * @param schId
	 * @return
	 */
	public New_Type checkByNew_Type(String typeName, String schId) {
		// 1、定义sql语句
		String sql = "select * from new_type where typeName = ? and schId = ?";
		// 2、设置参数集合
		List<Object> params = new ArrayList<Object>();

		params.add(typeName);
		params.add(schId);
		// 调用BaseDao的查询对象方法
		New_Type type = (New_Type) baseDao.queryRow(sql, params, New_Type.class);
		return type;
	}

	public long findNoteCount() {
		// 1、定义sql语句
		String sql = "select count(1) from tb_note n INNER JOIN tb_note_type t on n.typeId = t.typeId where userId =?";
		// 2、设置参数
		List<Object> params = new ArrayList<Object>();
		// 3、调用BaseDao
		long count = (long) baseDao.findSingleValue(sql, params);
		return count;
	}

	public List<Note> findNoteListByPage(Integer index, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Note> findNoteListByUserId(Integer userId) {
		// 定义sql语句
		String sql = "select noteId,title,pubTime,noteId from new_note where userId = ? ";
		// 2、设置参数集合
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
		List<Note> list = baseDao.queryRows(sql, params, Note.class);
		return list;
	}

	public Note findNoteById(String noteId) {
		// 定义sql语句
		String sql = "select title,content,pubTime,noteId,n.typeId typeId from new_note n inner join new_type t on n.typeId = t.typeId where noteId = ? ";
		// 设置参数集合
		List<Object> params = new ArrayList<Object>();
		params.add(noteId);

		Note note = (Note) baseDao.queryRow(sql, params, Note.class);
		return note;
	}

	/**
	 * 创建新的话题
	 * 
	 * @param typeName
	 * @param schId
	 * @return
	 */
	public int createByTypeNameToFind(String typeName, String schId) {
		// 1、定义sql语句
		String sql = "insert into new_type (typeName,schId) values (?,?)";
		List<Object> params = new ArrayList<>();
		params.add(typeName);
		params.add(schId);
		int row = baseDao.executeUpdate(sql, params);
		return row;
	}

	/**
	 * 添加后更新页面所需查询，仅查询一条type记录
	 * 
	 * @param typeName
	 * @param schId
	 * @return
	 */
	public New_Type findSingleType(String typeName, String schId) {
		// 定义sql语句
		String sql = "select typeId,typeName,schId from new_type where typeName = ? and schId = ?";
		List<Object> params = new ArrayList<>();
		params.add(typeName);
		params.add(schId);
		New_Type type = (New_Type) baseDao.queryRow(sql, params, New_Type.class);
		return type;
	}

	public int deleteNoteById(String noteId) {
		// 定义sql语句
		String sql = "delete from new_note where noteId = ?";
		// 设置参数集合
		List<Object> params = new ArrayList<Object>();
		params.add(noteId);

		int row = baseDao.executeUpdate(sql, params);

		return row;
	}

}
