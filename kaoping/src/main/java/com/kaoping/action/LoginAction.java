package com.kaoping.action;

import com.kaoping.service.LoginService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author ASUS
 *
 */
public class LoginAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3149340078807481285L;
	private int type;// 用户类型
	private int teacherId;// 用户Id
	private String password;// 用户密码

	private LoginService loginService;

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

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	// 功能方法开始
	/**
	 * @return 登录方法
	 */
	public String loginAction() {
		int loginTag = loginService.loginService(type, teacherId, password);
		if (loginTag == 0) {
			return "adminLogin";
		} else if (loginTag == 1) {
			return "cadminLogin";
		} else if (loginTag == 2) {
			return "teacherLogin";
		} else if (loginTag == 3) {
			return "teacherFirstLogin";
		} else {
			return ERROR;
		}
	}
}
