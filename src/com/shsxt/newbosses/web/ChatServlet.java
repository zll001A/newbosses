package com.shsxt.newbosses.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.newbosses.po.New_User;
import com.shsxt.newbosses.po.vo.ChatList;
import com.shsxt.newbosses.po.vo.ResultInfo;
import com.shsxt.newbosses.service.ChatService;
import com.shsxt.newbosses.util.Page;


/**
 * 进入论坛版块
 */
@WebServlet("/chatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ChatService chatService = new ChatService();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取参数
		String actionName = request.getParameter("actionName");
		//判断+【帖子分页】
		if("inchat".equals(actionName)){
			String local = request.getParameter("local");  
			//进入页面前查询数据
			inchat(request,response,local);                //查标题
			//根据帖子分页
			findNoteByPage(request,response,local);        //查内容
		}else if("page".equals(actionName)){
			String local = (String) request.getSession().getAttribute("local");
			findNoteByPage(request,response,local);        //查内容
		}else if("change".equals(actionName)){
			change(request,response);
			request.getRequestDispatcher("chat/Change.jsp").forward(request, response);
		}
	}

	

	private void change(HttpServletRequest request, HttpServletResponse response) {
		New_User user = (New_User) request.getSession().getAttribute("user");
		Integer userId = user.getUserId();
		List<ChatList> noteList = new ChatService().findNoteListByUserId(userId);
		// 将集合存到request作用域中
		request.setAttribute("chatList", noteList);

		
	}



	/**
	 * 根据帖子分页  
	    1、接收分页参数 （pageNum当前页、pageSize每页显示的数量）
		
		3、调用Service层的查询方法，返回Page对象
		4、将Page对象存到session作用域中
		5、设置动态包含的页面值
		6、跳转
	 * @param request
	 * @param response
	 * @param local 按地区查帖子做分页
	 * @throws IOException 
	 */
	private void findNoteByPage(HttpServletRequest request, HttpServletResponse response, String local) throws IOException {
		// 1、接收分页参数 （pageNum当前页、pageSize每页显示的数量）
		String pageNumStr = request.getParameter("pageNum");
		String pageSizeStr = request.getParameter("pageSize");
		
		// 3、调用Service层的查询方法，返回Page对象
		Page<ChatList> page = chatService.findNoteListByPage(pageNumStr,pageSizeStr,local);
		
		// 4、将Page对象存到session作用域中
		request.getSession().setAttribute("page", page);
		//重定向
		response.sendRedirect("http://localhost:8080/newbosses/chat/chatList-all.jsp");
	}

	/**
	 * 把查到的值放到域对象里
	 * 			1.查标题 String
	 * 						//2.查内容 List   有分页查了
	 * @param request
	 * @param response
	 * @param local2 
	 * @throws IOException 
	 */
	private void inchat(HttpServletRequest request, HttpServletResponse response, String local) throws IOException {
		// 接收参数
		String sch = request.getParameter("sch");
		
		//1.查标题 String     调用方法  先把出现一次的找出来
		ResultInfo<ChatList> resultInfo = chatService.findList(local,sch);
		String Lname = resultInfo.getResult().getLocalName();
		if(!resultInfo.getResult().equals(null)){
			//把{标题}放到域对象里
			request.getSession().setAttribute("Lname", Lname);
			//把{local}放到域对象里
			request.getSession().setAttribute("local", local);
		}else{
			return;
		}
		//查内容交给分页
		/*//2.查内容 调用方法  把其他内容显示出来
		List<ChatList> list = chatService.findContent(local,sch);
		
		//放到域对象里
		request.getSession().setAttribute("chatList", list);
		
		//重定向
		response.sendRedirect("chat/chatList-all.jsp");*/
		
	}

}
