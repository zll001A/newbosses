package com.shsxt.newbosses.service;

import java.util.List;

import com.shsxt.newbosses.dao.ChatDao;
import com.shsxt.newbosses.po.vo.ChatList;
import com.shsxt.newbosses.po.vo.ResultInfo;
import com.shsxt.newbosses.util.Page;
import com.shsxt.newbosses.util.StringUtil;

/**
 * 执行chat
 */

public class ChatService {
	
	private ChatDao chatDao = new ChatDao();
	
	/**
	 * 找到页面显示的标题信息
	 * @param local
	 * @param sch
	 * @return
	 */
	public ResultInfo<ChatList> findList(String local, String sch) {
		ResultInfo<ChatList> resultInfo = new ResultInfo<>();
		// 判断非空，地区为空不可能
		if (StringUtil.isEmpty(local)) {
			// 如果为空，code=0，msg=XX，返回resultInfo
			resultInfo.setCode(0);
			resultInfo.setMsg("系统异常，请重试~");
			return resultInfo;
		}
		// 2、第一次调用Dao层，返回对象 含有String类型   地区
		ChatList chatlist = chatDao.findByLocalAndSch(local,sch);
		if(chatlist.equals(null)){
			resultInfo.setCode(0);
			resultInfo.setMsg("系统异常，请重试~");
			
		}else{
			resultInfo.setResult(chatlist);
		}
		return resultInfo;
	}

	/**
	 * 查list列表里的全部数据
	 * @param local  sql现在只用这个
	 * @param sch
	 * @return
	 *//*   【交给分页了】
	public List<ChatList> findContent(String local, String sch) {
		List<ChatList> list = new ArrayList<>();
		//判断非空
		if(StringUtil.isEmpty(local)){
			list = null;
			return list;
		}
		//调用方法
		list = chatDao.findList(local,sch);
		if(list.equals(null)){
			list = null;
		}
		return list;
	}*/

	


	/**
	 * 根据帖子分页  
	 * @param pageNumStr
	 * @param pageSizeStr
	 * @param local 
	 * @return
	 */
	public Page<ChatList> findNoteListByPage(String pageNumStr, String pageSizeStr, String local) {
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
		
		// 2、调用Dao层的查询方法，得到总数量
		long count = chatDao.findNoteCount(local);
		
		// 3、判断总数量是否大于0，为空返回null
		if (count < 1) {
			return null;
		}
		
		// 4、得到page对象
		Page<ChatList> page = new Page<>(pageNum, pageSize, count);
		
		// 5、得到分页参数  （limit index,size : index表示开始查询的下标，size表示每页显示的数量pageSize）  a = (pageNum-1)*pageSize
		Integer index = (pageNum - 1) * pageSize;
		
		// 6、调用Dao层的查询方法，通过当前登录用户ID和分页参数查询当前页的数据集合
		List<ChatList> list = chatDao.findNoteListByPage(index,pageSize,local);
		
		// 7、将数据集合设置到page对象中
		page.setDataList(list);
		
		return page;
	}


	public List<ChatList> findNoteListByUserId(Integer userId) {
		List<ChatList> noteList = chatDao.findNoteListByUserId(userId);
		return noteList;
	}

	/**
	 * 根据搜索出的帖子【分页】
	 * @param pageNumStr
	 * @param pageSizeStr
	 * @param local
	 * @return
	 */
	public Page<ChatList> searchNoteListByPage(String pageNumStr, String pageSizeStr, String title) {
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
				
				// 2、调用Dao层的查询方法，得到符合搜索的总数量
				long count = chatDao.searchNoteCount(title);
				
				// 3、判断总数量是否大于0，为空返回null
				if (count < 1) {
					return null;
				}
				
				// 4、得到page对象
				Page<ChatList> page = new Page<>(pageNum, pageSize, count);
				
				// 5、得到分页参数  （limit index,size : index表示开始查询的下标，size表示每页显示的数量pageSize）  a = (pageNum-1)*pageSize
				Integer index = (pageNum - 1) * pageSize;
				
				// 6、调用Dao层的查询方法，通过当前登录用户ID和分页参数查询当前页的数据集合
				List<ChatList> list = chatDao.searchNoteListByPage(index,pageSize,title);
				
				// 7、将数据集合设置到page对象中
				page.setDataList(list);
				
				return page;
	}



}
