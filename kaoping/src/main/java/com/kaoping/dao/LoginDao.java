package com.kaoping.dao;

import com.kaoping.entities.Teacher;

public interface LoginDao {
	public Teacher loginDao(int type, int teacherId);
}
