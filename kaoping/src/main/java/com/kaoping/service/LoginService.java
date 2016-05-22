package com.kaoping.service;

import java.util.HashMap;

import com.kaoping.dao.LoginDao;
import com.kaoping.entities.Teacher;

public class LoginService {
	private LoginDao loginDao;
	HashMap<String, Object> loginHashMap = new HashMap<String, Object>();

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	/**
	 * @param type
	 *            �û�����
	 * @param teacherId
	 *            �û�id
	 * @param password
	 *            �û�����
	 * @return
	 */
	public HashMap<String, Object> loginService(int type, int teacherId, String password) {
		Teacher teacher = loginDao.loginDao(type, teacherId);
		if (teacher == null) {
			loginHashMap.put("tag", "ERROR");
		} else if (!password.equals(teacher.getPassword())) {
			loginHashMap.put("tag", "ERROR");
		} else if (teacher.getLoginNum() == 0) {
			loginHashMap.put("tag", "FIRST");
		} else {
			loginHashMap.put("tag", "SUCCESS");
			loginHashMap.put("teacher", teacher);
		}
		return loginHashMap;
	}
}
