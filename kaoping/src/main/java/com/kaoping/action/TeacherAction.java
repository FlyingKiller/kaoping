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
 * @author ASUS ��ʦ��ѯ������action��
 */
@Controller("TeacherAction")
@Scope("session")
public class TeacherAction extends ActionSupport implements SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7467701555597270207L;
	private int teacherId;// ����
	private String password;// ����
	private String name;// ����
	private String nation;// ����
	private String sex;// �Ա�(0-�У�1-Ů)
	private String cardId;// ����֤
	private String academy;// ����
	private String level;// ����
	private String status;// ��������
	private String degree;// ��λ����
	private String dignity;// רҵ
	private String positional;// �о�����
	private String positionalLevel;
	private String positionalSery;
	private int loginNum;
	private int id;// ����
	private int type;// ����
	private int nowPage;// ��ǰҳ
	private String departmentName;// ���Ż�ѧԺ
	private String levelName;// ����
	private InputStream inputStream;// ajaxʹ��
	private Map<String, Object> session;// Map���͵�session
	@Autowired
	private TeacherService teacherService;

	public int getNowPage() {
		return nowPage;
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
	// ���ܷ���

	/**��ѯ��ְ��
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
	 * @return ��ѯ��ʦҳ���ȡ���źͼ���
	 */
	public String getDeparetmentAndLevel() {
		session.put("academyDepartment", teacherService.getAcademy());
		session.put("level", teacherService.getLevel());
		return SUCCESS;
	}

	/**
	 * @return ���ӽ�ְ��
	 * @throws UnsupportedEncodingException
	 */
	public String addTeacher() throws UnsupportedEncodingException {
		System.out.println(sex + " " + degree + " " + positional);
		Teacher teacher = new Teacher(teacherId, password, name, nation, sex, cardId, academy, level, status, degree,
				dignity, positional, positionalLevel, positionalSery);
		if (teacherService.addTeacher(teacher) == 0) {
			inputStream = new ByteArrayInputStream("�˽�ʦ�Ѵ���".getBytes("utf-8"));
		} else {
			inputStream = new ByteArrayInputStream("���ӳɹ�".getBytes("utf-8"));
		}
		return SUCCESS;

	}
}