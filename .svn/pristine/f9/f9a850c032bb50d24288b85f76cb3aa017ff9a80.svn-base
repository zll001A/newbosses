package com.shsxt.newbosses.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.newbosses.po.New_Type;
import com.shsxt.newbosses.po.vo.LocalList;
import com.shsxt.newbosses.service.TypeService;

@WebServlet("/typeServlet")
public class TypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TypeService typeService = new TypeService();

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String actionName = request.getParameter("actionName");
		if("noteCount".equals(actionName)){
			//查询帖子数量和最后发帖时间等信息
			noteCount(request, response);
		}else{
			typeList(request, response);
		}	

	}


	/**
	 * 查询帖子数量和最后发帖时间等信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void noteCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 调用service层的信息
		List<LocalList> bbsMsg = typeService.findBbsMsg();
		//把list集合存入request域对象里
		request.getSession().setAttribute("bbsMsg", bbsMsg);
		//请求转发至chat/bbs.jsp
		/*request.getRequestDispatcher("chat/bbs.jsp").forward(request, response);*/
		response.sendRedirect("chat/bbs.jsp");
	}


	private void typeList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 调用Service层的查询方法，返回类型集合
		List<New_Type> list = typeService.findTypeList();
		// 将类型集合存到request域对象中
		request.setAttribute("typeList", list);
		
	
		
	}

}
