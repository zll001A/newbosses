package com.shsxt.newbosses.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

/**
 * 字符集过滤器    处理请求乱码	
 * 						POST请求											GET请求
 * 
 * 	Tomcat8及以上版本		request.setCharacterEncoding("UTF-8");			不会处理，不处理
 * 						new String(request.getParameter(name).getBytes("ISO-8859-1"),"UTF-8");
 * 
 * 	Tomcat7及以下版本		request.setCharacterEncoding("UTF-8");			new String(request.getParameter(name).getBytes("ISO-8859-1"),"UTF-8");
 * 						new String(request.getParameter(name).getBytes("ISO-8859-1"),"UTF-8");
 */
@WebFilter("/*")
public class EncodeFilter implements Filter {

    public EncodeFilter() {
    	
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
		
		// 基于HTTP请求
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		
		// 处理POST请求
		request.setCharacterEncoding("UTF-8"); // 只针对POST请求有效，GET请求没有任何影响
		
		// 得到当前请求方式 （GET/POST）
		String method = request.getMethod();
		// 判断是否是GET请求
		if (method.toUpperCase().equals("GET")) {
			// 判断服务器版本
			String serverInfo = request.getServletContext().getServerInfo(); //  Apache Tomcat/8.0.45    Apache Tomcat/7.0.79
			// 截取字符串，得到服务器的版本号
			String versionStr = serverInfo.substring(serverInfo.indexOf("/")+1, serverInfo.indexOf("/")+2);
			// 判断服务器版本是否是Tomcat8以下版本
			if (Integer.parseInt(versionStr) < 8) {
				
				// 处理GET请求乱码
				MyWapper myRequest = new MyWapper(request);
				// 放行资源
				chain.doFilter(myRequest, response);
				
				return;
			}
			
		}
		// 放行资源
		chain.doFilter(request, response);
		
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}
	
	/**
	 * 定义内部类，继承HttpServletRequestWrapper包装类，重写包装类中父类的getParameter()方法
	 * @author Lisa Li
	 *
	 */
	class MyWapper extends HttpServletRequestWrapper {

		HttpServletRequest request = null;
		public MyWapper(HttpServletRequest request) {
			super(request);
			this.request = request;
		}

		@Override
		public String getParameter(String name) {
			String value = request.getParameter(name);
			// 判断是否为空
			if (value == null || "".equals(value.trim())) {
				return null;
			}
			try {
				value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return value;
		}
		
	}

}
