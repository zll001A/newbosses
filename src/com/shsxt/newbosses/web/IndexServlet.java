package com.shsxt.newbosses.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.newbosses.po.vo.ChatList;
import com.shsxt.newbosses.service.ChatService;
import com.shsxt.newbosses.util.Page;



@WebServlet("/indexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		if(null==title){
			title = (String) request.getSession().getAttribute("title");
		}
		
		// 搜索框 【搜索功能】   标题查询
		noteListByTitle(request, response,title);
		

		request.getRequestDispatcher("chat/chatList-all.jsp").forward(request, response);
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
	private void noteListByTitle(HttpServletRequest request, HttpServletResponse response, String title) throws IOException {
		// 1、接收分页参数 （pageNum当前页、pageSize每页显示的数量）
		String pageNumStr = request.getParameter("pageNum");
		String pageSizeStr = request.getParameter("pageSize");
		
		// 3、调用Service层的查询方法，返回Page对象
		Page<ChatList> page = new ChatService().searchNoteListByPage(pageNumStr,pageSizeStr,title);
		
		// 4、将Page对象存到session作用域中
		request.getSession().setAttribute("page", page);
		// 将条件存到request作用域中
		request.getSession().setAttribute("title", title);
		request.setAttribute("Lname", "搜索");
		
	}


	

}
