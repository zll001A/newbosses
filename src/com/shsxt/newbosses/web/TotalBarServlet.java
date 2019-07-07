package com.shsxt.newbosses.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.newbosses.dao.TotalBarDao;
import com.shsxt.newbosses.po.TotalBar;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class TotalBarServlet
 */
@WebServlet("/totalBarServlet")
public class TotalBarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 创建DAO
		TotalBarDao totalBar = new TotalBarDao();
		// 从数据库里取数据
		ArrayList<TotalBar> totalArr = totalBar.query();
		// 设置服务器响应时向JSP表示层传输数据的编码格式
		resp.setContentType("text/html; charset=utf-8");
		// ArrayList对象转化为JSON对象
		JSONArray json = JSONArray.fromObject(totalArr);
		// 控制台显示JSON
		System.out.println(json.toString());
		// 返回到JSP
		PrintWriter writer = resp.getWriter();
		writer.println(json);
		writer.flush();
		// 关闭输出流
		writer.close();
	}

}
