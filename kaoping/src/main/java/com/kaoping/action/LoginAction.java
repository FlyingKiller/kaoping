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
 * @author ASUS ��¼��action��
 */
@Controller("LoginAction")
@Scope("session")
public class LoginAction extends ActionSupport implements SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3149340078807481285L;
	private int type;// �û�����
	private int teacherId;// �û�Id
	private String password;// �û�����
	private Map<String, Object> session;// Map���͵�session
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
	 * @return ��¼action����
	 */
	public String loginAction() {
		HashMap<String, Object> tagHashMap = loginService.loginService(type, teacherId, password);
		session.put("currentUser", tagHashMap.get("teacher"));
		return (String) tagHashMap.get("tag");
	}

}
