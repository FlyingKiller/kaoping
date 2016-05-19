package com.kaoping.action;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3149340078807481285L;
	private int type;// 用户类型
	private int teacherId;// 用户Id
	private String password;// 用户密码

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
