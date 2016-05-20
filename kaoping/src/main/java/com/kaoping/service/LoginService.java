package com.kaoping.service;

import java.util.HashMap;

import com.kaoping.dao.LoginDao;
import com.kaoping.entities.Teacher;

public class LoginService {
	private LoginDao loginDao;
	Teacher teacher;
	HashMap<String, Object> loginHashMap = new HashMap<String, Object>();

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	public HashMap<String, Object> loginService(int type, int teacherId, String password) {
		teacher = loginDao.loginDao(type, teacherId);
		loginHashMap.put("tag", "SUCCESS");
		if (teacher == null) {
			loginHashMap.put("tag", "ERROR");
		}
		if (!password.equals(teacher.getPassword())) {
			loginHashMap.put("tag", "ERROR");
		}
		if (teacher.getLoginNum() == 0) {
			loginHashMap.put("tag", "FIRST");
		}
		return loginHashMap;
	}
}
