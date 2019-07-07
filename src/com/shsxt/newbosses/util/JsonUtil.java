package com.shsxt.newbosses.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * 
 * @author Lisa Li
 *
 */
public class JsonUtil {

	/**
	 * 将Java对象转换成json格式的字符串，响应给ajax的回调函数
	 * @param object
	 * @param response
	 */
	public static void toJson(Object object, HttpServletResponse response ) {
		// 设置响应的类型及编码
		response.setContentType("application/json;charset=UTF-8");
		try {
			// 将result对象转换为json格式的字符串
			String json = JSON.toJSONString(object);
			// 得到字符输出流
			PrintWriter out = response.getWriter();
			// 输出响应结果
			out.write(json);
			// 关闭流
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
