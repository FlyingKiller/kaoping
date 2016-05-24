package com.kaoping.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaoping.dao.LoginDao;
import com.kaoping.entities.Teacher;

/**
 * @author ASUS
 * 登录service类
 */
@Service
public class LoginService {
	@Autowired
	private LoginDao loginDao;
	HashMap<String, Object> loginHashMap = new HashMap<String, Object>();

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	/**登录service方法
	 * @param type
	 *            用户类型
	 * @param teacherId
	 *            用户id
	 * @param password
	 *            用户密码
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
