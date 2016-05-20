package com.kaoping.service;

import com.kaoping.dao.LoginDao;

public class LoginService {
	private LoginDao loginDao;

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	public int loginService(int type, int teacherId, String password) {
		if (type == 0) {
			loginDao.adminLoginDao(type, teacherId, password);
			return 0;
		} else if (type == 1) {
			loginDao.cadminLoginDao(type, teacherId, password);
			return 0;
		} else {
			return 0;
		}
	}
}
