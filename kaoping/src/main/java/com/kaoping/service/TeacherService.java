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
 * @author ASUS ��ʦ��ѯ�����service��
 *
 */
@Service("TeacherService")
public class TeacherService {
	@Autowired
	private TeacherDao teacherDao;

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	/** ��ҳ��ѯ֮��ְ����ҳ��
	 * @param departmentName ���Ż�ѧԺ
	 * @param levelName ����
	 * @return
	 */
	public int getTeacherPage(String departmentName, String levelName) {
		return teacherDao.getTeacherPage(departmentName, levelName);
	}

	/**��ҳ��ѯ֮�����ְ�������
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
