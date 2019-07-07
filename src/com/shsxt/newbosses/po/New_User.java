package com.shsxt.newbosses.po;
/**
 * 用户表
 * @author dell
 *
 */
public class New_User {
	private Integer userId; //用户Id 主键
	private String uName;  //用户名
	private String uPwd;  // 用户密码
	private String nick; // 用户昵称
	private String head;  //用户头像
	private String mood; // 用户心情
	private String schId; //学校编号
	private String schName; //学校名称
	private int noteCount; //帖子数量
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getMood() {
		return mood;
	}
	public void setMood(String mood) {
		this.mood = mood;
	}
	public String getSchId() {
		return schId;
	}
	public void setSchId(String schId) {
		this.schId = schId;
	}
	public String getSchName() {
		return schName;
	}
	public void setSchName(String schName) {
		this.schName = schName;
	}
	public int getNoteCount() {
		return noteCount;
	}
	public void setNoteCount(int noteCount) {
		this.noteCount = noteCount;
	}
	
	
	
}
