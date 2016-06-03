package com.kaoping.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaoping.dao.TeacherDao;
import com.kaoping.entities.Academy;
import com.kaoping.entities.Level;
import com.kaoping.entities.Teacher;
import com.kaoping.tool.Page;

/**
 * @author ASUS 教师查询、添加service类
 *
 */
@Service("TeacherService")
public class TeacherService {
	@Autowired
	private TeacherDao teacherDao;

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	/** 分页查询之教职工总页数
	 * @param departmentName 部门或学院
	 * @param levelName 级别
	 * @return
	 */
	public int getTeacherPage(String departmentName, String levelName) {
		return teacherDao.getTeacherPage(departmentName, levelName);
	}

	/**分页查询之具体教职工结果集
	 * @param departmentName
	 * @param levelName
	 * @param page
	 * @return
	 */
	public List<Teacher> getTeacher(String departmentName, String levelName, Page page) {
		return teacherDao.getTeacher(departmentName, levelName,page);
	}

	public List<String> getAcademy() {
		return teacherDao.getAcademy();
	}

	public int addTeacher(Teacher teacher) {
		return teacherDao.addTeacherAdd(teacher);
	}

	public List<Level> getLevel() {
		return teacherDao.Level();
	}

	public List<Teacher> getTeacherByName(String teacherName, String academy) {
		return teacherDao.getTeacherByName(teacherName, academy);
	}

}
