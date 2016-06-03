package com.kaoping.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.kaoping.service.LoginService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author ASUS 登录的action类
 */
@Controller("LoginAction")
@Scope("session")
public class LoginAction extends ActionSupport implements SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3149340078807481285L;
	private int type;// 用户类型
	private int teacherId;// 用户Id
	private String password;// 用户密码
	private Map<String, Object> session;// Map类型的session
	@Autowired
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

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	 * @return 登录action方法
	 */
	public String loginAction() {
		HashMap<String, Object> tagHashMap = loginService.loginService(type, teacherId, password);
		session.put("currentUser", tagHashMap.get("teacher"));
		return (String) tagHashMap.get("tag");
	}

}
