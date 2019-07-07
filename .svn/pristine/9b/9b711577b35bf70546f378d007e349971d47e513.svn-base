package com.shsxt.newbosses.test;

import org.junit.Test;

import com.shsxt.newbosses.po.vo.ChatList;
import com.shsxt.newbosses.po.vo.ResultInfo;
import com.shsxt.newbosses.service.ChatService;

public class test {

	@Test
	public void test1() {
		ChatService chatService = new ChatService();
		ResultInfo<ChatList> resultInfo = chatService.findList("1", "10001");
		
		System.out.println(resultInfo.getResult());
		
		
	}

}
