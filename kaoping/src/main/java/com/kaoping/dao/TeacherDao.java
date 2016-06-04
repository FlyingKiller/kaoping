package com.kaoping.dao;

import java.util.List;

import com.kaoping.entities.Level;
import com.kaoping.entities.Teacher;
import com.kaoping.tool.Page;

public interface TeacherDao {

	public List<Teacher> getTeacher(String departmentName, String levelName, Page page);

	public List<String> getAcademy();

	public int addTeacherAdd(Teacher teacher);

	public int getTeacherPage(String departmentName, String levelName);

	public List<Level> Level();

	public List<Teacher> getTeacherByName(String teacherName, String academy);

	public Teacher getTeacherById(int teacherId);

	public void updateTeacher(Teacher teacher);

	public void deleteTeacher(int teacherId);

	public int checkAdminName(int teacherId);

	public void addAdmin(int teacherId);
}
