package com.shsxt.newbosses.po.vo;

/**
 * 返回的封装类
 * @author Lisa Li
 * @param <T>
 *
 */
public class ResultInfo<T> {

	private Integer code; // 状态码  1=成功，0=失败          存ID的               \
	private String msg; // 提示信息                                       存信息的           // |==>
	                                                               // |==>都是用来储存结果，传递值的
	private T result; // 返回的对象                                        存user对象的    /

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getResult() {
		return result;
	}

	public void setResult(T result) {
		this.result = result;
	}
	
	
		
}
