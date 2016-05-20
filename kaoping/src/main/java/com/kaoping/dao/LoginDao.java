package com.kaoping.dao;

public interface LoginDao {
	public void adminLoginDao(int type, int teacherId, String password);

	public void cadminLoginDao(int type, int teacherId, String password);

	public void teacherLoginDao(int type, int teacherId, String password);
}
