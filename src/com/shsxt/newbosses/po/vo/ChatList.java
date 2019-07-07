package com.shsxt.newbosses.po.vo;

import java.util.Date;

public class ChatList {
	private String localName;
	private String schName;
	private String typeName;
	private String title;
	private String content;
	private Date pubTime;
	private Integer noteId;
	
	private String sel;   //为空默认帖子分页,search为搜索分页
	
	public String getSel() {
		return sel;
	}
	public void setSel(String sel) {
		this.sel = sel;
	}
	private Object replyMsg;  //noteId对应的留言
	
	
	public Object getReplyMsg() {
		return replyMsg;
	}
	public void setReplyMsg(Object replyMsg) {
		this.replyMsg = replyMsg;
	}
	public Integer getNoteId() {
		return noteId;
	}
	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}
	private Integer haveChat;
	
	
	public Integer getHaveChat() {
		return haveChat;
	}
	public void setHaveChat(Integer haveChat) {
		this.haveChat = haveChat;
	}
	public String getLocalName() {
		return localName;
	}
	public void setLocalName(String localName) {
		this.localName = localName;
	}
	public String getSchName() {
		return schName;
	}
	public void setSchName(String schName) {
		this.schName = schName;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPubTime() {
		return pubTime;
	}
	public void setPubTime(Date pubTime) {
		this.pubTime = pubTime;
	}
	
	
	
}
