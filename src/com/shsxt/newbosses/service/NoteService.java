package com.shsxt.newbosses.service;

import java.util.List;

import com.shsxt.newbosses.dao.NoteDao;
import com.shsxt.newbosses.po.New_Type;
import com.shsxt.newbosses.po.Note;
import com.shsxt.newbosses.po.vo.ResultInfo;
import com.shsxt.newbosses.util.Page;
import com.shsxt.newbosses.util.StringUtil;

public class NoteService {
	private NoteDao noteDao = new NoteDao();

	public List<New_Type> findTypeList() {
		List<New_Type> list = new TypeService().findTypeList();
		
		return list;
	}

	public ResultInfo<Note> addOrUpdate(String typeId, String title, String content, Integer userId,String noteId) {
		ResultInfo<Note> resultInfo = new ResultInfo<>();
		
		//  1、判断参数是否为空
		if (StringUtil.isEmpty(typeId)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("请选择帖子类型！");
			return resultInfo;
		}
		if (StringUtil.isEmpty(title)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("帖子标题不能为空！");
			return resultInfo;
		}
		if (StringUtil.isEmpty(content)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("帖子内容不能为空！");
			return resultInfo;
		}
		if (userId.equals(null)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("请先登录！");
			return resultInfo;
		}
		int row = noteDao.addOrUpdate(typeId,title,content,userId,noteId);
		
		if (row >0) {
			resultInfo.setCode(1);
		} else {
			resultInfo.setCode(0);
			resultInfo.setMsg("保存失败！");
		}
		return resultInfo;
	}
	
	

	/**
	 * 找类型列表，限定schId
	 * @param schId
	 * @return
	 */
	public List<New_Type> findTypeList(String schId) {
		List<New_Type> list = null;
		// 判断非空
		if(StringUtil.isEmpty(schId)){
			//
			list = new TypeService().findTypeList();
			System.out.println(schId+":数据库user表schId为空");
		}else{
			list = new TypeService().findTypeList(schId);
		}
		return list;
	}

	/**
	 * 验证类型的唯一性
	 *  1、判断参数（类型名）
		2、调用Dao层，查询类型记录，返回类型对象
		3、判断类型对象是否存在
			存在，code=0，msg=xx
			不存在，code=1.msg=xx
	 * @param typeId
	 * @param typeName
	 * @return
	 */
	public ResultInfo<New_Type> checkByNew_Type(String typeName,String schId) {
		ResultInfo<New_Type> resultInfo = new ResultInfo<New_Type>();
		// 1. 判断参数
		if (StringUtil.isEmpty(typeName)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("类型名称不能为空！");
			return resultInfo;
		}
		if (StringUtil.isEmpty(schId)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("请登录后发起话题");
			return resultInfo;
		}
		//2、调用Dao层，查询类型记录，返回类型对象
		New_Type type = noteDao.checkByNew_Type(typeName,schId);
		
		// 3、判断类型对象是否存在
		if (type == null) { // 不存在，code=1.msg=xx
			resultInfo.setCode(1);
			resultInfo.setMsg("该话题还未发布");
		} else { // 存在，code=0，msg=xx
			// 如果存在，判断当前记录被占用
			resultInfo.setCode(0);
			resultInfo.setMsg("该话题已被发布，可直接发布帖子");
		}
		
		return resultInfo;
	}

	/**
	 * 分页
	 * @param pageNumStr
	 * @param pageSizeStr
	 * @return
	 */
	public Page<Note> findNoteListByPage(String pageNumStr, String pageSizeStr) {
		
		// 1、判断分页参数是否为空，为空则设置默认值
		Integer pageNum = 1; // 默认查询第一页
		Integer pageSize = 5; // 默认每页显示5条数据
		// 如果前台传递的数据不为空，则使用前台传递的值
		if (StringUtil.isNotEmpty(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		if (StringUtil.isNotEmpty(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		
		// 2、调用Dao层的查询方法，得到当前登录用户的云记的总数量
		long count = noteDao.findNoteCount();
		
		// 3、判断总数量是否大于0，为空返回null
		if (count < 1) {
			return null;
		}
		
		// 4、得到page对象
		Page<Note> page = new Page<>(pageNum, pageSize, count);
		
		// 5、得到分页参数  （limit index,size : index表示开始查询的下标，size表示每页显示的数量pageSize）  a = (pageNum-1)*pageSize
		Integer index = (pageNum - 1) * pageSize;
		
		// 6、调用Dao层的查询方法，通过当前登录用户ID和分页参数查询当前页的数据集合
		List<Note> list = noteDao.findNoteListByPage(index,pageSize);
		
		// 7、将数据集合设置到page对象中
		page.setDataList(list);
		
		return page;
	}


	public List<Note> findNoteList(Integer userId) {
		List<Note> noteList = noteDao.findNoteListByUserId(userId);
		return noteList;
	}

	public Note findNoteById(String noteId) {
		// 判断非空
				if (StringUtil.isEmpty(noteId)) {
					return null;
				}
				Note note = noteDao.findNoteById(noteId);
				return note;
	}


	/**
	 * 创建话题
	 * 	1.验证非空
	 * 	2.调取dao层方法 返回受到影响的行数
	 * 	3.判断是否成功
	 * @param typeName
	 * @param schId
	 * @return
	 */
	public ResultInfo<New_Type> createByNew_Type(String typeName, String schId) {
		ResultInfo<New_Type> resultInfo = new ResultInfo<New_Type>();
		// 1. 判断参数
		if (StringUtil.isEmpty(typeName)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("类型名称不能为空！");
			return resultInfo;
		}
		if (StringUtil.isEmpty(schId)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("请登录后发起话题");
			return resultInfo;
		}
		//2.调取dao层方法 返回受到影响的行数
		int row = noteDao.createByTypeNameToFind(typeName,schId);
		if(row>0){
			resultInfo.setCode(1);
			New_Type type = noteDao.findSingleType(typeName,schId);
			resultInfo.setResult(type);
		}else{
			resultInfo.setCode(0);
			resultInfo.setMsg("网络异常，请重新发布");
		}
		return resultInfo;
	}

	public ResultInfo<Note> deleteNote(String noteId) {
		ResultInfo<Note> resultInfo = new ResultInfo<>();
		if (StringUtil.isEmpty(noteId)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("删除失败！");
			return resultInfo;
		}
		
		// 调用Dao层的更新方法，返回受影响的行数
		int row  = noteDao.deleteNoteById(noteId);
		
		// 判断是否成功
		if (row > 0) {
			resultInfo.setCode(1);
		} else {
			resultInfo.setCode(0);
			resultInfo.setMsg("删除失败！");
		}
		
		return resultInfo;
	}


}
