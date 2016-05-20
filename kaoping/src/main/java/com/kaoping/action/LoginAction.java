package com.kaoping.action;

import java.util.HashMap;

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
	private int type;// �û�����
	private int teacherId;// �û�Id
	private String password;// �û�����

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

	/**
	 * @return ��¼����
	 */
	public String loginAction() {
		HashMap<String, Object> tagHashMap = loginService.loginService(type, teacherId, password);
		return (String) tagHashMap.get("tag");
	}
}
