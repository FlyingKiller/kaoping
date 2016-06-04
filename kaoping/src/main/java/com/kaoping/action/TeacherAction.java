package com.kaoping.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.kaoping.entities.Teacher;
import com.kaoping.service.TeacherService;
import com.kaoping.tool.Page;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author ASUS 教师查询、添加action类
 */
@Controller("TeacherAction")
@Scope("session")
public class TeacherAction extends ActionSupport implements SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7467701555597270207L;
	private int teacherId;// 工号
	private String password;// 密码
	private String name;// 姓名
	private String nation;// 民族
	private String sex;// 性别(0-男；1-女)
	private String cardId;// 身份证
	private String academy;// 部门
	private String level;// 级别
	private String status;// 党政级别
	private String degree;// 岗位类型
	private String dignity;// 专业
	private String positional;// 研究方向
	private String positionalLevel;
	private String positionalSery;
	private int loginNum;
	private int id;// 主键
	private int type;// 类型
	private int nowPage;// 当前页
	private String departmentName;// 部门或学院
	private String levelName;// 级别
	private InputStream inputStream;// ajax使用
	private Map<String, Object> session;// Map类型的session
	private String teacherName;// 按名字查询教职工之姓名
	@Autowired
	private TeacherService teacherService;

	public int getNowPage() {
		return nowPage;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getDignity() {
		return dignity;
	}

	public void setDignity(String dignity) {
		this.dignity = dignity;
	}

	public String getPositional() {
		return positional;
	}

	public void setPositional(String positional) {
		this.positional = positional;
	}

	public String getPositionalLevel() {
		return positionalLevel;
	}

	public void setPositionalLevel(String positionalLevel) {
		this.positionalLevel = positionalLevel;
	}

	public String getPositionalSery() {
		return positionalSery;
	}

	public void setPositionalSery(String positionalSery) {
		this.positionalSery = positionalSery;
	}

	public int getLoginNum() {
		return loginNum;
	}

	public void setLoginNum(int loginNum) {
		this.loginNum = loginNum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	// 功能方法

	/**
	 * 查询教职工
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getTeacher() throws UnsupportedEncodingException {
		Page page = new Page(teacherService.getTeacherPage(departmentName, levelName), nowPage);
		List<Teacher> teacherList = teacherService.getTeacher(departmentName, levelName, page);
		session.put("evaTeacherList", teacherList);
		session.put("evaTeacherPage", page);
		session.put("nowDepartment", departmentName);
		session.put("nowLevelName", levelName);
		if (teacherList != null) {
			inputStream = new ByteArrayInputStream("success".getBytes("utf-8"));
		} else {
			inputStream = new ByteArrayInputStream("none".getBytes("utf-8"));
		}
		return SUCCESS;
	}

	/**
	 * 按名字查询教职工
	 * 
	 * @return
	 */
	public String getTeacherByName() {
		List<Teacher> teacherList = teacherService.getTeacherByName(teacherName, academy);
		session.put("evaTeacherList", teacherList);
		session.put("nowDepartment", "");
		session.put("nowLevelName", "");
		session.put("evaTeacherPage", "");
		return SUCCESS;
	}

	/**
	 * 查询教师页面获取部门和级别
	 * 
	 * @return
	 */
	public String getDeparetmentAndLevel() {
		session.put("academyDepartment", teacherService.getAcademy());
		session.put("level", teacherService.getLevel());
		return SUCCESS;
	}

	/**
	 * 添加教职工
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String addTeacher() throws UnsupportedEncodingException {
		System.out.println(sex + " " + degree + " " + positional);
		Teacher teacher = new Teacher(teacherId, password, name, nation, sex, cardId, academy, level, status, degree,
				dignity, positional, positionalLevel, positionalSery);
		if (teacherService.addTeacher(teacher) == 0) {
			inputStream = new ByteArrayInputStream("此教师已存在".getBytes("utf-8"));
		} else {
			inputStream = new ByteArrayInputStream("添加成功".getBytes("utf-8"));
		}
		return SUCCESS;
	}

	/**
	 * 按工号获取教职工
	 * 
	 * @return
	 */
	public String getTeacherById() {
		Teacher teacher = teacherService.getTeacherById(teacherId);
		session.put("updateTeacher", teacher);
		return SUCCESS;
	}

	/**
	 * 更新教职工信息
	 * 
	 * @return
	 */
	public String updateTeacher() {
		Teacher teacher = new Teacher(teacherId, password, name, nation, sex, cardId, academy, level, status, degree,
				dignity, positional, positionalLevel, positionalSery, id);
		teacherService.updateTeacher(teacher);
		session.put("evaTeacherList", teacherService.getTeacherById(teacherId));
		return SUCCESS;
	}

	/**
	 * 删除教职工
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String deleteTeacher() throws UnsupportedEncodingException {
		teacherService.deleteTeacher(teacherId);
		inputStream = new ByteArrayInputStream("删除成功".getBytes("utf-8"));
		session.put("evaTeacherList", "");
		session.put("nowDepartment", "");
		session.put("nowLevelName", "");
		session.put("evaTeacherPage", "");
		return SUCCESS;
	}

	/**
	 * 添加管理员时ajax验证工号
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String checkAdminName() throws UnsupportedEncodingException {
		if (teacherService.checkAdminName(teacherId) == 1) {
			inputStream = new ByteArrayInputStream("已设为管理员".getBytes("utf-8"));
		} else if (teacherService.checkAdminName(teacherId) == 3) {
			inputStream = new ByteArrayInputStream("工号可用".getBytes("utf-8"));
		} else {
			inputStream = new ByteArrayInputStream("工号不存在".getBytes("utf-8"));
		}
		return SUCCESS;
	}

	/**
	 * 添加管理员
	 * 
	 * @return
	 */
	public String addAdmin() {
		teacherService.addAdmin(teacherId);
		return SUCCESS;
	}

	/**
	 * 获取全部管理员
	 * 
	 * @return
	 */
	public String getAdmin() {
		List<Teacher> adminList = teacherService.getAdmin();
		session.put("adminList", adminList);
		return SUCCESS;
	}

	/**删除管理员
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String deleteAdmin() throws UnsupportedEncodingException {
		teacherService.deleteAdmin(teacherId);
		getAdmin();
		inputStream = new ByteArrayInputStream("删除成功".getBytes("utf-8"));
		return SUCCESS;
	}
}
