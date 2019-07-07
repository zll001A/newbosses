package com.shsxt.newbosses.po;

import java.util.Date;

/**
 * 储存论坛发布的具体内容
 * @author dell
 *
 */
public class New_Note {
	private Integer noteId;//内容编号  主键
	private String title;//标题
	private String content;//内容
	private Integer typeId;//主题类型
	private Date pubTime;//发布时间
	
	
	public Integer getNoteId() {
		return noteId;
	}
	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
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
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Date getPubTime() {
		return pubTime;
	}
	public void setPubTime(Date pubTime) {
		this.pubTime = pubTime;
	}
	
	
}
